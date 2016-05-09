defmodule Swolen.PrivateChannel do
  use Phoenix.Channel

  def join("private:" <> username, _message, socket) do
    if username == socket.assigns.username do
      {:ok, socket}
    else
      {:error, %{reason: "you're not who you say you are..."}}
    end
  end
end
