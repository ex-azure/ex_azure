defmodule ExAzure.HttpClient.ReqClient do
  @moduledoc """
  A HTTP client implementation using the `req` library.
  """
  alias ExAzure.Commons.HeaderNames
  alias ExAzure.Errors.{InvalidResponse, InvalidRequest, InvalidAuth, Unexpected}

  @behaviour ExAzure.HttpClient

  @impl true
  def request(req, opts) do
    case Req.new(
           method: req.method,
           base_url: req.base_url,
           headers: req.headers ++ auth_headers(req.auth, opts)
         )
         |> Req.request(
           url: req.path,
           json: req.body,
           params: req.query,
           decode_json: [keys: :atoms!]
         ) do
      {:ok, %Req.Response{status: status, body: body}} when status == 200 ->
        {:ok, body}

      {:ok, %Req.Response{status: status, body: body}} when status in [401, 403] ->
        {:error, InvalidAuth.exception(status_code: status, path: req.path, cause: body)}

      {:ok, %Req.Response{status: status, body: body}} when status in 400..499 ->
        {:error, InvalidRequest.exception(status_code: status, path: req.path, cause: body)}

      {:ok, %Req.Response{status: status, body: body}} when status >= 500 ->
        {:error, InvalidResponse.exception(status_code: status, path: req.path, cause: body)}

      {:error, err} ->
        {:error, Unexpected.exception(operation: "HTTP Request", cause: err)}
    end
  end

  def auth_headers(:subscription_key, opts),
    do: [{HeaderNames.auth_key(), opts[:subscription_key]}]
end
