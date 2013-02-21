App.ApplicationRoute = Ember.Route.extend({
  activate: function() {
    this.get('pubsub').subscribe('dashboard');
  },

  deactivate: function() {
    this.get('pubsub').unsuscribe('dashboard');
  }
});
