DS.RESTAdapter.configure('plurals', {
  story: 'stories'
});

App.Store = DS.Store.extend({
  revision: 11,
  adapter: DS.RESTAdapter.create({
    namespace: 'api'
  })
});
