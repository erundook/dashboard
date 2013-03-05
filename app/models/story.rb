class Story < ActiveRecord::Base
  attr_accessible :preferences, :source, :team_member, :source_uid

  belongs_to :team_member
  belongs_to :source

  delegate :source_type, to: :source

  serialize :preferences, ActiveRecord::Coders::Hstore

  validates_uniqueness_of :source_uid

  pusherable('dashboard')
end
