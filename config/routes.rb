AmiandoStats::Application.routes.draw do
  resources :tickets
  root to: 'maps#show'
end
