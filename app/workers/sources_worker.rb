class SourcesWorker
  include Sidekiq::Worker

  def perform
    Source.all.each do |source|
      source.fetch_updates
    end
  end
end
