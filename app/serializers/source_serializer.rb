class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :preferences, :source_type
end
