Dashboard::Application.routes.draw do
  class FormatTest
    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == @mime_type
    end
  end

  namespace :api, constraints: FormatTest.new(:json) do
    resources :team_members
    resources :sources
    resources :stories
  end

  match "*path" => "ember#start", constraints: FormatTest.new(:html)
  root :to => 'ember#start', constraints: FormatTest.new(:html)
end
