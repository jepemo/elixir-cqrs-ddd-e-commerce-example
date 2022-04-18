defmodule Ecommerce.Shared.Test.Infrastructure.Bus.Command.InMemoryCommandBus do
  # @behaviour Ecommerce.Shared.Domain.Bus.Command.CommandBus

  def dispatch(command) do
    handler = get_handler(command)
    handler.handle(command)
  end

  def get_handler(command) do
    Application.get_env(:backoffice, :in_memory_command_bus_deps)
    |> Enum.find(fn {cmd, _handler} ->
      cmd == command.__struct__
    end)
    |> elem(1)
  end
end
