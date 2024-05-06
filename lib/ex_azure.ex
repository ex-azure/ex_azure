defmodule ExAzure do
  @moduledoc false

  alias ExAzure.Config

  def request(request, opts \\ []) do
    with {:ok, opts} <- Config.new(opts) do
      impl().request(request, opts)
    end
  end

  defp impl(),
    do:
      Application.get_env(
        :ex_azure,
        :http_client,
        ExAzure.HttpClient.ReqClient
      )
end
