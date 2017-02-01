Rails.application.routes.draw do
  get 'user/new'

  get 'user/create'

  get 'user/update'

  get 'user/edit'

  get 'user/destroy'

  get 'user/index'

  get 'user/show'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'products/index'

  resources :products

  resources :categories

  root 'products#index'
end
