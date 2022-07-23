Rails.application.routes.draw do
  devise_for :users
  root to: 'spaces#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spaces, only: [:index, :show, :new, :create] do
    resources :bookings, only: [ :new, :create ]
    resources :bookmarks
  end
  resources :bookings, only: :index
  resources :lists, only: [:index, :show, :update, :destroy]

end
