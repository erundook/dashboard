class Source < ActiveRecord::Base
  attr_accessible :name, :preferences

  serialize :preferences, ActiveRecord::Coders::Hstore

  has_many :stories
end
