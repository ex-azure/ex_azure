defmodule ExAzure.HttpClient do
  @moduledoc """
  Behaviour that defines a HTTP client for ExAzure.
  """
  alias ExAzure.Errors.{Forbidden, InvalidRequest, InvalidResponse, Internal}
  alias ExAzure.Request

  @callback request(Request.t()) ::
              {:ok, map()}
              | {:error, Forbidden.t() | InvalidRequest.t() | InvalidResponse.t() | Internal.t()}
end
