Rails.application.routes.draw do
  root to: 'habits#today'

  resources :habits do
    get :today, on: :collection, action: :today

    resources :logs, only: %i[create destroy], module: :habits
  end

  # resources :categories, only: :index

  resource :account
  resource :profile

  get  '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  get  '/signup'  => 'accounts#new'
  post '/account' => 'accounts#create'
end
