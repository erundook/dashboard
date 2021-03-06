App.Source = DS.Model.extend({
  name: DS.attr('string'),
  stories: DS.hasMany('App.Story'),
  preferences: DS.attr('object'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date')
});
