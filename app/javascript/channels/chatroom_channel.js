import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        setTimeout(() => { 
          messagesContainer.insertAdjacentHTML('beforeend', data);
          messagesContainer.scrollTop = messagesContainer.scrollHeight; 
        }, 200)
      },
    });
  }
}

export { initChatroomCable };
