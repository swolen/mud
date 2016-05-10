import {Socket} from "phoenix"
import {Chat} from "./chat"

let socket = new Socket("/socket", {params: {username: window.username}})
socket.connect()

let channel = socket.channel("rooms:juice_bar", {})
let chat = new Chat("#chat-input", "#messages")

chat.onSubmit( () => {
  channel.push("new_msg", { body: chat.getInput() })
    .receive("ok", response => {
      response.messages.forEach(body => chat.addMessage(response.from, body))
    })
})

channel.on("new_msg", payload => chat.addMessage(payload.from, payload.body))

channel.join()
  .receive("ok", resp => console.log("Joined successfully", resp))
  .receive("error", resp => console.log("Unable to join", resp))

export default socket
