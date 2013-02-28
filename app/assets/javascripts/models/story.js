App.Story = DS.Model.extend({
  source: DS.belongsTo('App.Source'),
  teamMember: DS.belongsTo('App.TeamMember'),
  preferences: DS.attr('object'),
  sourceUid: DS.attr('string'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date')
});
