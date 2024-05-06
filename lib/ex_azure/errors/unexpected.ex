defmodule ExAzure.Errors.Unexpected do
  use Splode.Error, fields: [:operation, :cause], class: :unexpected

  @type t() :: Splode.Error.t()

  def message(%{operation: op, cause: cause}) do
    "Unexpected error during operation '#{inspect(op)}': #{inspect(cause)}"
  end
end
