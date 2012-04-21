AmiandoStats::Application.routes.draw do
  resources :places
  root to: 'maps#show'
end
