class TeamMemberSerializer < ActiveModel::Serializer
  attributes :id, :title, :email, :first_name, :last_name, :nickname, :hired_at, :avatar
end
