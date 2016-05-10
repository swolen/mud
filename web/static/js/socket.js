import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {username: window.username}})
socket.connect()

let channel = socket.channel("rooms:juice_bar", {})
let priv = socket.channel(`private:${window.username}`, {})

let $chatInput = $("#chat-input")
let $messagesContainer = $("#messages")
let enterKeyCode = 13

$chatInput.on("keypress", event => {
  if(event.keyCode === enterKeyCode) {
    channel.push("new_msg", {body: $chatInput.val()})
    $chatInput.val("")
  }
})

channel.on("new_msg", payload => {
  $messagesContainer.prepend(`[${Date()}] ${payload.from}: ${payload.body}\n`)
})

priv.on("whisper", payload => {
  $messagesContainer.prepend(`[${Date()}] ${payload.from}: ${payload.body}\n`)
})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

priv.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket
