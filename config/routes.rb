Rails.application.routes.draw do

  root 'home#router'
  resources :users, only: [:edit, :update, :destroy]
  resources :payments, only: [:index, :show, :create]
  resources :subscriptions, only: [:new, :create, :destroy]
  resources :plans, only: [:new, :index]
  match '/auth/:provider/callback', to: 'auth#create', via: [:get, :post]
  get '/logout', to: 'auth#destroy'
  get '/dashboard', to: 'home#dashboard'
  post '/stripe/webhook', to: 'subscriptions#webhook'
  get '/:handle' => 'payments#new', as: :new_payment
end
