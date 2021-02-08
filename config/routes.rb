Rails.application.routes.draw do
  root to: 'habits#today'

  resources :habits do
    get :today, on: :collection, action: :today

    resources :logs, only: %i[create destroy], module: :habits
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
