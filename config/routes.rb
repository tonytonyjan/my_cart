Rails.application.routes.draw do
  post 'allpay/result'
  post 'allpay/return'
  namespace :admin do
    resources :orders, :products
  end
  root 'products#index'
  resources :products, only: :show
  resource :cart, only: %i[show update]
  resources :orders, only: %i[new create show] do
    get :checkout, on: :member
  end
  resources :line_items, only: %i[create update destroy]
end
