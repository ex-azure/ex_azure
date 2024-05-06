defmodule ExAzure.Errors.InvalidAuth do
  use Splode.Error, fields: [:request_path, :status_code, :cause], class: :forbidden

  @type t() :: Splode.Error.t()

  @impl true
  def message(%{cause: cause, request_path: path, status_code: code}) do
    "Unable to authorize a call to '#{path}' with status_code '#{inspect(code)}': #{inspect(cause)}"
  end
end
