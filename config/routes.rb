Rails.application.routes.draw do
  resources :years, only: [:index, :show] do
    resources :weeks, only: [:index, :show]
  end

  resources :days, only: [] do
    member do
      post 'items'
    end
  end
end
