App.Router.map(function() {
  this.resource('teamMembers', function() {
    this.resource('teamMember', { path: ':team_member_id' });
  });

  this.resource('sources', function() {
    this.resource('source', { path: ':source_id' });
  });

  this.resource('stories', function() {
    this.resource('story', { path: ':story_id' });
  });
});
