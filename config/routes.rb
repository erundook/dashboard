Dashboard::Application.routes.draw do
  namespace :api do
    resources :team_members
    resources :sources
    resources :stories
  end

  root :to => 'ember#start'
  match "/*path" => "ember#start"
end
