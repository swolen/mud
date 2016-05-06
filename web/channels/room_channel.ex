defmodule Swolen.RoomChannel do
  use Phoenix.Channel

  # Allow anyone to join this room
  def join("rooms:juice_bar", message, socket) do
    {:ok, socket}
  end

  # All other rooms considered private for now
  def join("rooms:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  # Incoming messages from clients
  def handle_in("new_msg", %{"body" => body}, socket) do
    # "broadcast!/3 will notify all joined clients on this socket's topic and invoke their handle_out/3 callbacks."
    broadcast!(socket, "new_msg", %{body: body, from: socket.assigns.username})
    {:noreply, socket}
  end
end
