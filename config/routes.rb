Rails.application.routes.draw do
  # get 'booking/new'
  # get 'booking/create'
  # get 'booking/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :gardens do
    resources :bookings, only: [:new , :create, :update, :edit, :show, :destroy] do
      resources :rooms
      resources :room_messages
    end
    resources :reviews, only: [:create]
  end
  get '/dashboard', to: 'dashboards#dashboard'

  # Defines the root path route ("/")
  # root "articles#index"
end
