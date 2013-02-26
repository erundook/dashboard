App.ApplicationRoute = Ember.Route.extend({
  activate: function() {
    this.get('pusher').subscribe('dashboard');
  },

  deactivate: function() {
    this.get('pusher').unsuscribe('dashboard');
  }
});
