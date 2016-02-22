Rails.application.routes.draw do

  # THE IDEAS CONTROLLER
  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :joins, only: [:create, :destroy]
  end

  # THE JOINS CONTROLLER
  # This is to allow us to have a page showing all the users who have joined
  resources :joins, only: [:index]
  
  # THE USERS CONTROLLER
  resources :users, only: [:create, :new]

  # THE SESSIONS CONTROLLER
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root "ideas#index"

end
