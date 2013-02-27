App.Story = DS.Model.extend({
  source: DS.belongsTo('App.Source'),
  teamMember: DS.belongsTo('App.TeamMember'),
  preferences: DS.attr('object'),
  sourceUID: DS.attr('string')
});
