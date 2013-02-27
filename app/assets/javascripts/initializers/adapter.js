DS.JSONTransforms.object = {
  deserialize: function(serialized) {
    return Ember.isNone(serialized) ? null : serialized;
  },

  serialize: function(deserialized) {
    return Ember.isNone(deserialized) ? null : deserialized;
  }
}
