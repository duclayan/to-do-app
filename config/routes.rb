Rails.application.routes.draw do
  # resources :tasks
  # resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonr
  

  # get '/' => 'categories#index', as: 'categories'
  # get '/categories/new' => 'categories#new', as: 'new_category'
  # post '/categories/create' => 'categories#create', as: 'create_category'
  # delete '/categories/:id' => 'categories#delete', as: 'delete_category'
  # put '/categories/update/:id/' => 'categories#update', as: 'update_category'
  # get '/categories/:id' => 'categories#show', as: 'show_category'
  # get '/categories/edit/:id' => 'categories#edit', as: 'edit_category'

  # get '/' => 'tasks#index', as: 'tasks'
  # get '/tasks/new' => 'tasks#new', as: 'new_task'
  # post '/tasks/create' => 'tasks#create', as: 'create_task'
  # delete '/tasks/:id' => 'tasks#delete', as: 'delete_task'
  # put '/tasks/update/:id/' => 'tasks#update', as: 'update_task'
  # get '/tasks/:id' => 'tasks#show', as: 'show_task'
  # get '/tasks/edit/:id' => 'tasks#edit', as: 'edit_task'

  get 'categories/new' 
  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id/edit' => 'tasks#update', as: 'update_task'

  resources :categories do
    resources :tasks
  end

  root 'categories#new'

end
