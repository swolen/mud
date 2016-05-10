defmodule Swolen.Commands.DispatchTest do
  use ExUnit.Case, async: true

  alias Swolen.Commands.Dispatch

  test "handle unknown command" do
    {action, response} = Dispatch.handle("fire ze missiles", "france")

    assert action == :reply
    assert response == ~s(🤔 WHAT DO YOU MEAN "fire ze missiles"!?)
  end

  test "handle 'don' command" do
    {action, response} = Dispatch.handle("don chicken suit", "boss")

    assert action == :broadcast
    assert response == "boss has donned a(n) chicken suit"
    assert Swolen.UserState.get("boss") == "chicken suit"
  end
end
