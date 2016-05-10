let Chat = exports.Chat = function(inputSelector, outputSelector) {
  let input = $(inputSelector)
  let output = $(outputSelector)

  this.onSubmit = function(callback) {
    let enterKeyCode = 13
    input.on("keypress", event => {
      if(event.keyCode === enterKeyCode) {
        callback()
        input.val("")
      }
    })
  }

  this.getInput = function() {
    return input.val()
  }

  this.addMessage = function(from, message) {
    output.prepend(`<li>[${Date()}] ${from}: ${message}</li>`)
  }
}
