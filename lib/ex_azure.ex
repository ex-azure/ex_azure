defmodule ExAzure do
  @moduledoc false

  def request(request), do: impl().request(request)

  defp impl(),
    do:
      Application.get_env(
        :ex_azure,
        :http_client,
        ExAzure.HttpClient.ReqClient
      )
end
