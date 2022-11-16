Rails.application.routes.draw do
 devise_for :users, :controllers => { :registrations => 'registrations' }
   devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  # resources :categories do
  #   resources :expenditures
  # end

   resources :categories, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :category_expenditures, only: [:index]
  end

  resources :expenditures, only: [:new, :create, :destroy, :show]

  # if user is not logged in, redirect to login page
  unauthenticated do
    root 'splash#index'
  end

  # if user is logged in, redirect to categories#index
  authenticated do
    root 'categories#index', as: :authenticated_root
  end
end
