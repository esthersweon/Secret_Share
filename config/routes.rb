SecretShareAjax::Application.routes.draw do
  resources :users, only: [:create, :new, :show, :index] do
    resources :secrets, only: [:new]
    resources :friendships, only: [:create, :destroy]
  end

  resource :session, only: [:create, :destroy, :new]
  resources :secrets, only: [:create, :destroy]

  root to: "users#index"
end