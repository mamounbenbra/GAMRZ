import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    messagesContainer.scrollTo(0, messagesContainer.scrollHeight - 10)
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        setTimeout(() => {
          messagesContainer.insertAdjacentHTML('beforeend', data);
        }, 200)
      },
    });
  }
}

export { initChatroomCable };
