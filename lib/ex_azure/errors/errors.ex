defmodule ExAzure.Errors do
  @moduledoc """
  Defines the error types for the Azure SDK.
  """
  @moduledoc section: :errors
  use Splode,
    error_classes: [
      invalid_request: ExAzure.Errors.InvalidRequest,
      invalid_response: ExAzure.Errors.InvalidResponse,
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

defmodule ExAzure.Errors.InvalidRequest do
  @moduledoc """
  Defines the error type for invalid requests to Azure Services.
  """
  @moduledoc section: :errors
  use Splode.ErrorClass, class: :invalid_request

  @type t() :: Splode.Error.t()
end

defmodule ExAzure.Errors.InvalidResponse do
  @moduledoc """
  Defines the error type for invalid responses from Azure Services.
  """
  @moduledoc section: :errors
  use Splode.ErrorClass, class: :invalid_response

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
