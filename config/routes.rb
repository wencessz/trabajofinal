Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => {
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root 'avisos#index'

  #get 'users/show', as: 'user_root'

  resources :users
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  resources :categories, only: [:index, :show]
  resources :avisos
  resources :communicates, only: [:new, :create, :show]


  get 'admin/users', as: 'admin_users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
