App.Router.map(function() {
  this.resource('teamMembers', { path: '/team_members' });
  this.resource('teamMember', { path: '/team_members/:team_member_id' });

  this.resource('sources', { path: '/sources' });
  this.resource('source', { path: '/sources/:source_id' });

  this.resource('stories', { path: '/stories' });
  this.resource('story', { path: '/stories/:story_id' });
});
