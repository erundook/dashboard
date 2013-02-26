module SourceTypes
  class Base
    def initialize(source)
      @source = source
      @query = eval(@source.preferences['query'] || '')
      @api_keys = eval(@source.preferences['api_keys'] || '')
    end

    def fetch_updates
      raise 'You must implement a fetch_updates method for your source type!'
    end
  end
end
