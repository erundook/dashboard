Ember.ControllerMixin.reopen({
  pubsub: null
});

Ember.Application.initializer({
  name: 'pubsub',

  initialize: function(container, application) {
    // Use the same instance of Pubsub everywhere in the app
    container.optionsForType('pubsub', { singleton: true });

    // Register 'pubsub:main' as our Pubsub object
    container.register('pubsub', 'main', application.Pubsub);

    // Inject the Pubsub object into all controllers and routes
    container.typeInjection('controller', 'pubsub', 'pubsub:main');
    container.typeInjection('route', 'pubsub', 'pubsub:main');
  }
});
