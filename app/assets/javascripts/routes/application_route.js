App.ApplicationRoute = Ember.Route.extend({
  activate: function() {
    this.get('pusher').subscribe('dashboard');
  },

  deactivate: function() {
    this.get('pusher').unsuscribe('dashboard');
  },

  events: {
    // 'story.create': function(data) {
    //   var record = App.Story.find(data.model_id);
    //   if (record.get('id') && record.get('stateManager').get('currentState.name') != 'inFlight') {
    //     record.get('stateManager').goToState('loaded');
    //   }
    // },

    // 'story.update': function(data) {
    //   var record = App.Story.find(data.model_id);
    //   if (record.get('id') && record.get('stateManager').get('currentState.name') != 'inFlight') {
    //     record.reload();
    //   }
    // },

    // 'story.destroy': function(data) {
    //   var record = App.Story.find(data.model_id);
    //   if (record.get('id') && record.get('stateManager').get('currentState.name') != 'inFlight') {
    //     record.get('stateManager').goToState('deleted.saved');
    //   }
    // }
  }
});
