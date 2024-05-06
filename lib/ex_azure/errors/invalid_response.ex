defmodule ExAzure.Errors.InvalidResponse do
  use Splode.Error, fields: [:request_path, :status_code, :cause], class: :invalid

  @type t() :: Splode.Error.t()

  @impl true
  def message(%{cause: cause, request_path: path, status_code: code}) do
    "Invalid Response from Azure SDK from the path '#{path}' with status_code '#{inspect(code)}': #{inspect(cause)}"
  end
end
