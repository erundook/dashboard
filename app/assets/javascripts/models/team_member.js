App.TeamMember = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  nickname: DS.attr('string'),
  title: DS.attr('string'),
  email: DS.attr('string'),
  avatar: DS.attr('object'),
  hiredAt: DS.attr('date'),
  stories: DS.hasMany('App.Story'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date'),

  fullName: function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }.property('firstName', 'lastName'),

  mailto: function() {
    return 'mailto:' + this.get('email');
  }.property('email'),

  avatarUrl: function() {
    return this.get('avatar')['avatar']['url'];
  }.property('avatar')
});
