class Story < ActiveRecord::Base
  attr_accessible :preferences, :source, :team_member

  belongs_to :team_member
  belongs_to :source

  serialize :preferences, ActiveRecord::Coders::Hstore
end
