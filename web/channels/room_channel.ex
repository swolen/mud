defmodule Swolen.RoomChannel do
  use Phoenix.Channel

  # Allow anyone to join this room
  def join("rooms:juice_bar", _message, socket) do
    {:ok, socket}
  end

  # All other rooms considered private for now
  def join("rooms:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  # Incoming messages from clients
  def handle_in("new_msg", %{"body" => body}, socket) do
    # "broadcast!/3 will notify all joined clients on this socket's topic and invoke their handle_out/3 callbacks."
    broadcast!(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end

  # handle_out/3 isn't a required callback, but it allows us to customize and filter broadcasts before they reach each client. By default, handle_out/3 is implemented for us and simply pushes the message on to the client, just like our definition. 
  def handle_out("new_msg", payload, socket) do
    push(socket, "new_msg", payload)
    {:noreply, socket}
  end

end 
