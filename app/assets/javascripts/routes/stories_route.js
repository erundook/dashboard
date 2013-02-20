App.StoriesRoute = Ember.Route.extend({
  model: function() {
    return App.Story.find();
  },

  setupController: function(controller, model) {
    controller.set('stories', model);
  }
});
