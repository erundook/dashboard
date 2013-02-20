App.SourcesRoute = Ember.Route.extend({
  model: function() {
    return App.Source.find();
  },

  setupController: function(controller, model) {
    controller.set('sources', model);
  }
});
