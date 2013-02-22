class Source < ActiveRecord::Base
  attr_accessible :name, :source_type, :preferences

  serialize :preferences, ActiveRecord::Coders::Hstore

  has_many :stories

  def fetch_updates
    SourceTypes.registered_types[self.source_type.to_s].new(self).fetch_updates
  end
end
