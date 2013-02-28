class TeamMemberSerializer < ActiveModel::Serializer
  attributes :id, :title, :email, :first_name, :last_name, :nickname, :hired_at, :avatar, :updated_at, :created_at
end
