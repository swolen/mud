defmodule Swolen.Commands.Dispatch do
  def handle("don " <> item, user) do
    Swolen.UserState.set(user, item)
    {:broadcast, "#{user} has donned a(n) #{item}"}
  end

  def handle(command, _user) do
    {:reply, ~s(🤔 WHAT DO YOU MEAN "#{command}"!?)}
  end
end
