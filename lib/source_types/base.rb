module SourceTypes
  class Base
    def initialize(source)
    end

    def fetch_updates
      raise 'You must implement a fetch_updates method for your source type!'
    end
  end
end
