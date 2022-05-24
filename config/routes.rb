Rails.application.routes.draw do
  get 'booking/new'
  get 'booking/create'
  get 'booking/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   resources :gardens
  # Defines the root path route ("/")
  # root "articles#index"
end
