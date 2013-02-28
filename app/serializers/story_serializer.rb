class StorySerializer < ActiveModel::Serializer
  attributes :id, :preferences, :source_type, :source_uid, :updated_at, :created_at
end
