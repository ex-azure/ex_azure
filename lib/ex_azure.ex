defmodule ExAzure do
  @moduledoc false
  use Application

  alias ExAzure.Config

  def request(request, opts \\ []) do
    with {:ok, opts} <- Config.new(opts) do
      impl().request(request, opts)
    end
  end

  @doc false
  @impl Application
  def start(_type, _args) do
    children = []

    opts = [strategy: :one_for_one, name: ExAzure.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp impl(),
    do:
      Application.get_env(
        :ex_azure,
        :http_client,
        ExAzure.HttpClient.ReqClient
      )
end
