App.Pubsub = Ember.Object.extend({
  key: function() {
    return Ember.$('meta[name=pusher-key]').attr('content');
  }.property(),

  init: function() {
    console.log('PUBSUB: Starting...');
    var _this = this;
    this.service = new Pusher(this.get('key'));
    this.service.connection.bind('connected', function() { _this.connected(); });
    this.service.bind_all(function(eventName, data) { _this.handleEvent(eventName, data); });
  },

  connected: function() {
    this.socketId = this.service.connection.socket_id;
    this.addSocketIdToXHR();
  },

  // Add X-Pusher-Socket header so we can exclude the sender from their own actions
  // More: [http://pusher.com/docs/server_api_guide/server_excluding_recipients]
  addSocketIdToXHR: function() {
    var _this = this;
    Ember.$.ajaxPrefilter(function(options, originalOptions, xhr) {
      return xhr.setRequestHeader('X-Pusher-Socket', _this.socketId);
    });
  },

  subscribe: function(channel) {
    console.log('PUBSUB: Subscribed to "' + channel + '"');
    return this.service.subscribe(channel);
  },

  unsubscribe: function(channel) {
    console.log('PUBSUB: Unsubscribed to "' + channel + '"');
    return this.service.unsubscribe(channel);
  },

  handleEvent: function(eventName, data) {
    var router, unhandled;

    console.log('PUBSUB: -------------------------------');
    console.log('PUBSUB: Event: "' + eventName + '"');
    console.log('PUBSUB: Data:');
    console.log(data);
    console.log('PUBSUB: -------------------------------');

    // Ignore Pusher internal events
    if (eventName.match(/^pusher:/)) return;

    router = this.get('container').lookup('router:main');
    try {
      router.send(eventName, data);
    } catch (e) {
      unhandled = e.message.match(/Nothing handled the event/);
      if (!unhandled) { throw e };
    }
  }
});
