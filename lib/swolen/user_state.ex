defmodule Swolen.UserState do
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def all do
    Agent.get(__MODULE__, &(&1))
  end

  def set(username, new_state) do
    Agent.update(__MODULE__, fn map -> Map.put(map, username, new_state) end)
  end
end
