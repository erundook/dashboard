App.TeamMembersRoute = Ember.Route.extend({
  model: function() {
    return App.TeamMember.find();
  },

  setupController: function(controller, model) {
    controller.set('teamMembers', model);
  }
});
