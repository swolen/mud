defmodule Swolen.Commands.Dispatch do
  def handle(command, _user) do
    {:reply, ~s(🤔 WHAT DO YOU MEAN "#{command}"!?)}
  end
end
