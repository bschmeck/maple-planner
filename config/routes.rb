Rails.application.routes.draw do
  devise_for :users
  resources :years, only: [:index, :show] do
    resources :weeks, only: [:index, :show]
  end

  resources :days, only: [] do
    member do
      post 'items'
    end
  end

  root to: "years#index"
end
