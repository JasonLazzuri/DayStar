Rails.application.routes.draw do
  devise_for :users
  resources :welcome

  root :to => 'welcome#index'
end
