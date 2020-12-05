Rails.application.routes.draw do
  # resources :tasks
  # resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonr
  
  # get 'categories/new' 
  # get 'tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  # patch '/tasks/:id/edit' => 'tasks#update', as: 'update_task'

  resources :categories do
    resources :tasks
  end

  root 'categories#new'

end
