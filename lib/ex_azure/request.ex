defmodule ExAzure.Request do
  defstruct [:auth, :method, :base_url, :path, :headers, :body, :query]

  @type auth() :: :subscription_key

  @type methods() :: :get | :post | :put | :delete

  @type t() :: %__MODULE__{
          auth: auth(),
          method: methods(),
          base_url: String.t(),
          path: String.t(),
          headers: map() | keyword(),
          body: map() | struct() | nil,
          query: map() | keyword()
        }
end
