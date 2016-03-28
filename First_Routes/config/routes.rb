Rails.application.routes.draw do
  #resources :users

  get 'users/new' => 'users#new', :as => 'new_user'
  get 'users/:id' => 'users#show', :as => 'show_user'
  patch 'users/:id' => 'users#update', :as => 'patch_update_user'
  put 'users/:id' => 'users#update', :as => 'update_user'
  delete 'users/:id' => 'users#destroy', :as => 'delete_user'
  get 'users/:id/edit'  => 'users#edit', :as => 'edit_user'
  get 'users' => 'users#index', :as => 'index_users'
  post 'users' => 'users#create', :as => 'create_user'

end
