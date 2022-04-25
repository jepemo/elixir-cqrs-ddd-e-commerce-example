defmodule Ecommerce.Shared.Domain.Bus.Command.Command do
  defmacro __using__(opts) do
    fields = Enum.map(opts, fn opt -> {opt, nil} end)

    quote location: :keep do
      defstruct unquote(fields)

      var_types = Enum.reduce(unquote(opts), [], fn opt, acc ->
        acc ++ [{opt, :binary}]
      end)

      quote do
        @type t :: %__MODULE__{unquote_splicing(var_types)}
      end

      @type param :: {atom(), String.t()}

      @spec new([param]) :: any()
      def new(args) when is_list(args) do
        data = args |> Enum.into(%{})
        struct(__MODULE__, data)
      end
    end
  end
end
