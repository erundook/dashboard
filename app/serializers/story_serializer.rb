class StorySerializer < ActiveModel::Serializer
  attributes :id, :preferences, :source_type
end
