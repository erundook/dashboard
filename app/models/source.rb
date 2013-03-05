class Source < ActiveRecord::Base
  attr_accessible :name, :source_type, :preferences

  serialize :preferences, ActiveRecord::Coders::Hstore

  has_many :stories

  pusherable('dashboard')

  def fetch_updates
    registered_source_type.fetch_updates
  end

  private

  def registered_source_type
    @registered_source_type ||= SourceTypes.registered_types[self.source_type.to_s].new(self)
  end
end
