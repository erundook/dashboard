module SourceTypes
  class Twitter < Base
    def initialize(source)
      super(source)
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
