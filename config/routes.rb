Rails.application.routes.draw do
  devise_for :users
  resources :todo_lists
  root "todos#index"
  resources :todos
  get "sessions/login" => 'sessions#login'
end
