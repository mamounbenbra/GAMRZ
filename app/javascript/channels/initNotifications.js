import consumer from "./consumer";

const initNotifications = () => {
  const id = document.getElementById('navbarDropdown').dataset.userId
  console.log(id)
  consumer.subscriptions.create({ channel: "ChannelMatchChannel" , id: id}, {
      received(data) {
        const wrapper = document.getElementById('matches_wrap')
        wrapper.insertAdjacentHTML('beforeend', '<div id="notif"></div>');
      },
    });
}

export { initNotifications };
