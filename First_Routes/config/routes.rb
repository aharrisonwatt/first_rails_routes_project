Rails.application.routes.draw do
  resources :users, only: [:update, :show, :index, :destroy, :create]

  resources :contacts
  resources :contact_shares
end
