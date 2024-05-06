defmodule ExAzure.Request do
  defstruct [:method, :base_url, :path, :headers, :body, :query]

  @type methods() :: :get | :post | :put | :delete

  @type t() :: %__MODULE__{
          method: methods(),
          base_url: String.t(),
          path: String.t(),
          headers: map() | keyword(),
          body: map() | struct() | nil,
          query: map() | keyword()
        }

  def new(method, base_url, path, headers, body, query) do
    %ExAzure.Request{
      method: method,
      base_url: base_url,
      path: path,
      headers: headers,
      body: body,
      query: query
    }
  end
end
