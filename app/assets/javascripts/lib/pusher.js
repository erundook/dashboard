Ember.ControllerMixin.reopen({
  pusher: null
});

Ember.Application.initializer({
  name: 'pusher',

  initialize: function(container, application) {
    // Use the same instance of pusher everywhere in the app
    container.optionsForType('pusher', { singleton: true });

    // Register 'pusher:main' as our pusher object
    container.register('pusher', 'main', application.Pusher);

    // Inject the pusher object into all controllers and routes
    container.typeInjection('controller', 'pusher', 'pusher:main');
    container.typeInjection('route', 'pusher', 'pusher:main');
  }
});

App.Pusher = Ember.Object.extend({
  key: function() {
    return Ember.$('meta[name=pusher-key]').attr('content');
  }.property(),

  init: function() {
    Ember.debug('Pusher.init');
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
    Ember.debug('Pusher.subscribe : "' + channel + '"');
    return this.service.subscribe(channel);
  },

  unsubscribe: function(channel) {
    Ember.debug('Pusher.unsubscribe : "' + channel + '"');
    return this.service.unsubscribe(channel);
  },

  handleEvent: function(eventName, data) {
    var router, unhandled, eventArray, record;

    // Ignore Pusher internal events
    if (eventName.match(/^pusher:/)) return;

    Ember.debug('Pusher.handleEvent : "' + eventName + '"');

    router = this.get('container').lookup('router:main');
    try {
      router.send(eventName, data);
    } catch (e) {
      unhandled = e.message.match(/Nothing handled the event/);
      if (!unhandled) { throw e };
    }

    try {
      eventArray = eventName.split('.');
      record = App[eventArray[0].classify()].find(data.id);

      if (record.get('id') && record.get('stateManager').get('currentState.name') != 'inFlight') {
        switch (eventArray[1]) {
          case 'create': record.get('stateManager').goToState('loaded');
            break;
          case 'update': record.reload();
            break;
          case 'destroy': record.get('stateManager').goToState('deleted.saved');
            break;
        }
      }
    } catch (e) {
      console.log(e);
    }
  }
});
