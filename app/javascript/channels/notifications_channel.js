import Cookies from 'js-cookie';
import consumer from './consumer';


  consumer.subscriptions.create('NotificationsChannel', {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log('NotificationsChannel connected');
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
      console.log('NotificationsChannel disconnected');
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log('NotificationsChannel received', data);
    },
  });
