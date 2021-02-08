Rails.application.routes.draw do
  root to: 'habits#index'

  resources :habits do
    get "/today", on: :collection, to: proc { |env|
      env["action_dispatch.request.path_parameters"]["date"] = Date.today.to_s
      HabitsController.action("index").call(env)
    }

    resources :logs, only: %i[create destroy], module: :habits
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
