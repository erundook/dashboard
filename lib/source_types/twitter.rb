module SourceTypes
  class Twitter < Base
    def initialize(source)
      super(source)

      ::Twitter.configure do |config|
        config.consumer_key       = @api_keys[:consumer_key]
        config.consumer_secret    = @api_keys[:consumer_secret]
        config.oauth_token        = @api_keys[:oauth_token]
        config.oauth_token_secret = @api_keys[:oauth_secret]
      end
    end

    def fetch_updates
      return if @query.blank?

      @query.each do |query, value|
        send(query.to_sym, value)
      end
    end

    def hashtag(query)
      search_term(query)
    end

    def handle(query)
      ::Twitter.user(query).status
    end

    def search_term(query)
      ::Twitter.search(query, { since_id: since_id }).results
    end

    private

    def since_id
      @since_id ||= Story.includes(:source).where('sources.source_type' => @source.source_type).last.source_uid
    end
  end

  register('twitter', Twitter)
end
