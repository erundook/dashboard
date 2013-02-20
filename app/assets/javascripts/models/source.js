App.Source = DS.Model.extend({
  name: DS.attr('string'),
  stories: DS.hasMany('App.Story'),
  preferences: DS.attr('object')
});
