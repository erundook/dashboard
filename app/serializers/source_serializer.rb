class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :preferences, :source_type, :updated_at, :created_at
end
