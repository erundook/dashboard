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
