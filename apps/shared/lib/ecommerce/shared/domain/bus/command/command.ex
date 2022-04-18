defmodule Ecommerce.Shared.Domain.Bus.Command.Command do
  defmacro __using__(opts) do
    fields = Enum.map(opts, fn opt -> {opt, nil} end)
    # string_t = quote do: String.t()
    # string_t = :binary
    # type = Enum.map(opts, fn opt -> {opt, string_t} end) |> Enum.into(%{})

    quote do
      defstruct unquote(fields)

      # @type t :: struct(__MODULE__, quote(type))
      # @type t :: %unquote(__CALLER__.module) {unquote(type)}
      # @type t :: %unquote(__MODULE__.module){
      #       unquote(Module.get_attribute(__CALLER__.module, :components)
      #               |> Enum.map(fn {name, type} -> {name, Atom.to_string(type)} end)
      #               |> Enum.reverse
      #               |> Macro.escape)}
      @type t :: unquote(Enum.reduce(opts, &{:|, [], [&1, &2]}))

      # def new  do
      #   unquote(struct(__MODULE__, ))
      # end
    end
  end
end
