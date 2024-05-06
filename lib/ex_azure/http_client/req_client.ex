defmodule ExAzure.HttpClient.ReqClient do
  @moduledoc """
  A HTTP client implementation using the `req` library.
  """
  alias ExAzure.Errors.{Internal, InvalidResponse, InvalidRequest, Forbidden}

  @behaviour ExAzure.HttpClient

  @impl true
  def request(req) do
    case Req.new(
           method: req.method,
           base_url: req.base_url,
           headers: req.headers
         )
         |> Req.request(url: req.path, json: req.body, query: req.query) do
      {:ok, %Req.Response{status: status_code, body: body}} when status_code == 200 ->
        {:ok, body}

      {:ok, %Req.Response{status: status_code, body: _body}} when status_code in [401, 403] ->
        {:error, Forbidden.exception()}

      {:ok, %Req.Response{status: status, body: _body}} when status in 400..499 ->
        {:error, InvalidRequest.exception()}

      {:ok, %Req.Response{status: status, body: _body}} when status >= 500 ->
        {:error, InvalidResponse.exception()}

      {:error, _} ->
        {:error, Internal.exception()}
    end
  end
end
