defmodule Swolen.Commands.DispatchTest do
  use ExUnit.Case, async: true

  alias Swolen.Commands.Dispatch

  test "handle unknown command" do
    {action, response} = Dispatch.handle("fire ze missiles", "france")

    assert action == :reply
    assert response == ~s(🤔 WHAT DO YOU MEAN "fire ze missiles"!?)
  end
end
