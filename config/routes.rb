Rails.application.routes.draw do
  resources :transactions
  get 'plans/new'

  get 'plans/index'

  get 'plans/edit'

  #Callback Url for Paystack after payment to create subscription /start
  get 'subscriptions/success'
  #Callback Url for Paystack after payment to create trnsaction 
  get 'transactions/success'
  
  resources :videos
  
  resources :subscriptions
  devise_for :users
  root to: "static#index"

  get 'static/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
