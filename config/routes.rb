Rails.application.routes.draw do
  resources :todo_lists
  root "todos#index"
  resources :todos
end
