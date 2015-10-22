Rails.application.routes.draw do
  namespace :admin do
    resources :orders, :products
  end
  post 'allpay/result'
  post 'allpay/return'
  root 'products#index'
  resources :products, only: :show
  resource :cart, only: %i[show update]
  resources :line_items, only: %i[create update destroy]
  resources :orders, only: %i[new create show] do
    get :checkout, on: :member
  end
end
