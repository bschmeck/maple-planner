Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :years, only: [:index, :show, :create] do
    member do
      post :extend
      get :for_date
    end
    resources :weeks, only: [:index, :show]
    resources :rows, only: [:create]
  end

  resources :days, only: [] do
    member do
      post 'items'
    end
  end

  resources :shares, only: [:show]

  root to: "years#index"
end
