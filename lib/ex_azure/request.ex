defmodule ExAzure.Request do
  defstruct auth: :subscription_key,
            method: :get,
            base_url: nil,
            path: nil,
            headers: [],
            body: nil,
            query: []

  @type auth() :: :subscription_key

  @type methods() :: :get | :post | :put | :delete

  @type t() :: %__MODULE__{
          auth: auth(),
          method: methods(),
          base_url: String.t(),
          path: String.t(),
          headers: list({String.t(), String.t()}),
          body: map() | struct() | nil,
          query: list({String.t(), String.t()})
        }
end
