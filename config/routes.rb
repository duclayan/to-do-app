Rails.application.routes.draw do
  devise_for :users
  # resources :tasks
  # resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonr

  # resources :categories do
  #   resources :tasks
  # end

  resources :users do
    resources :categories do
      resources :tasks
    end
  end


  namespace :user do
    root :to => "tasks#index"
  end

  root 'tasks#index'

end
