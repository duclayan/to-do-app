Rails.application.routes.draw do
  #resources: categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'categories#index', as: 'categories'
  get '/categories/new' => 'categories#new', as: 'new_category'
  post '/categories/create' => 'categories#create', as: 'create_category'
  delete '/categories/:id' => 'categories#delete', as: 'delete_category'
  put '/categories/update/:id/' => 'categories#update', as: 'update_category'
  get '/categories/:id' => 'categories#show', as: 'show_category'
  get '/categories/edit/:id' => 'categories#edit', as: 'edit_category'
end
