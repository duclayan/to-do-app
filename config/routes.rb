Rails.application.routes.draw do
  # resources :tasks
  # resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonr

  resources :categories do
    resources :tasks
  end

  root 'tasks#index'

end
