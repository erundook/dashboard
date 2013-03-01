Dashboard::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :team_members
      resources :sources
      resources :stories
    end
  end

  root :to => 'ember#start'
end
