defmodule ExAzure.Config do
  @schema NimbleOptions.new!(
            region: [
              type: :string,
              required: true
            ],
            subscription_key: [
              type: :string,
              required: true
            ]
          )

  alias __MODULE__

  @type t() :: [unquote(NimbleOptions.option_typespec(@schema))]

  @spec new(Keyword.t()) :: {:ok, Config.t()} | {:error, NimbleOptions.ValidationError.t()}
  def new(config \\ []),
    do:
      default_config()
      |> Keyword.merge(config)
      |> NimbleOptions.validate(@schema)

  defp default_config,
    do: [
      region: Application.get_env(:ex_azure, :region),
      subscription_key: Application.get_env(:ex_azure, :subscription_key)
    ]
end
