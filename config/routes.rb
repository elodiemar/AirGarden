Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :gardens do
    resources :bookings, only: [:new , :create, :update, :edit, :show, :destroy] do
      resources :rooms
    end
    resources :reviews, only: [:create]
  end
  get '/dashboard', to: 'dashboards#dashboard'
  get '/messages', to: 'messages#messages'

  resources :room_messages

  # Defines the root path route ("/")
  # root "articles#index"
end
