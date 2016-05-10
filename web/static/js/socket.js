import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {username: window.username}})
socket.connect()

let channel = socket.channel("rooms:juice_bar", {})
let $chatInput = $("#chat-input")
let $messagesContainer = $("#messages")
let enterKeyCode = 13
let displayMessage = function (message) {
  $messagesContainer.prepend(`<li>[${Date()}] ${message.from}: ${message.body}</li>`)
}

// When user presses enter, send their chat message, watch for a response from
// the server, and clear the input
$chatInput.on("keypress", event => {
  if(event.keyCode === enterKeyCode) {
    channel.push(
      "new_msg", {body: $chatInput.val()}
    ).receive(
      "ok", (response) =>
        response.messages.forEach(body => {
        displayMessage({from: response.from, body: body})
        })
    )
    $chatInput.val("")
  }
})

channel.on("new_msg", payload => {
  displayMessage(payload)
})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket
