Rails.application.routes.draw do
  get 'plans/new'

  get 'plans/index'

  get 'plans/edit'


  resources :videos
  
  resources :subscriptions
  devise_for :users
  root to: "static#index"

  get 'static/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
