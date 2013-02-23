class TeamMember < ActiveRecord::Base
  attr_accessible :title, :email, :first_name, :last_name, :nickname, :hired_at, :avatar

  mount_uploader :avatar, AvatarUploader

  has_many :stories

  # pubsubable
end
