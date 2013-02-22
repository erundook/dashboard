module SourceTypes
  class << self
    def registered_types
      @registered_types ||= {}
    end

    def register(source_type, source_type_class)
      registered_types[source_type.to_s] = source_type_class
    end
  end
end

Dir[File.dirname(__FILE__) + '/source_types/*.rb'].each { |f| require f }
