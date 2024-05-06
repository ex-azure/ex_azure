defmodule ExAzure.Errors do
  @moduledoc """
  Defines the error types for the Azure SDK.
  """
  @moduledoc section: :errors
  use Splode,
    error_classes: [
      invalid: ExAzure.Errors.Invalid,
      internal: ExAzure.Errors.Internal,
      forbidden: ExAzure.Errors.Forbidden
    ],
    unknown_error: ExAzure.Errors.Unknown
end

defmodule ExAzure.Errors.Forbidden do
  @moduledoc """
  Defines the error type for not being authorized.
  """
  @moduledoc section: :errors
  use Splode.ErrorClass, class: :forbidden

  @type t() :: Splode.Error.t()
end

defmodule ExAzure.Errors.Internal do
  @moduledoc """
  Define an error class for internal sdk errors.
  """
  @moduledoc section: :errors
  use Splode.ErrorClass, class: :internal

  @type t() :: Splode.Error.t()
end

defmodule ExAzure.Errors.Invalid do
  @moduledoc """
  Defines the error type for invalid requests to Azure Services.
  """
  @moduledoc section: :errors
  use Splode.ErrorClass, class: :invalid

  @type t() :: Splode.Error.t()
end

defmodule ExAzure.Errors.Unknown do
  @moduledoc """
  Defines the error type for an unknown error.
  """
  @moduledoc section: :errors
  use Splode.ErrorClass, class: :unknown

  @type t() :: Splode.Error.t()
end
