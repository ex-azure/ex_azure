defmodule ExAzure.HttpClient do
  @moduledoc """
  Behaviour that defines a HTTP client for ExAzure.
  """
  alias ExAzure.Errors.{Forbidden, Invalid, Unexpected}
  alias ExAzure.Request

  @callback request(Request.t(), ExAzure.Config.t()) ::
              {:ok, map()}
              | {:error, Forbidden.t() | Invalid.t() | Unexpected.t()}
end
