defmodule Ecommerce.Shared.Test.Infrastructure.Bus.Command.InMemoryCommandBus do
  # @behaviour Ecommerce.Shared.Domain.Bus.Command.CommandBus

  def dispatch(command) do
    with {:ok, handler} <- get_handler(command) do
      handler.handle(command)
    end
  end

  def get_handler(command) do
    Application.get_env(:backoffice, :in_memory_command_bus_deps)
    |> Enum.find(fn {cmd, _handler} ->
      cmd == command.__struct__
    end)
    |> case do
      nil -> {:error, "There is no command handler for command of type: #{inspect(command.__struct__)}"}
      {_cmd, handler} -> {:ok, handler}
    end
  end
end
