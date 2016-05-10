defmodule Swolen.Commands.Dispatch do
  def handle(command) do
    {:reply, ~s(🤔 WHAT DO YOU MEAN "#{command}"!?)}
  end
end
