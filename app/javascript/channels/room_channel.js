import consumer from "./consumer"

  consumer.subscriptions.create("RoomChannel", {
    connected() {
      //console.log('success')
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      //console.log(data)
      const messageContainer = document.getElementById('messages')
      const username = parseInt(document.getElementById('userId').innerText)

      let html;

      if (username === data.message.user_id) {
        //console.log('right')
        html = data.right
      } else {
        /*console.log('left')
        console.log(username)
        console.log(data.message.user_id)*/
        html = data.left
      }

      messageContainer.innerHTML = messageContainer.innerHTML + html
      //messageContainer.append(html.innerHTML)
      // Called when there's incoming data on the websocket for this channel
    }
  });
