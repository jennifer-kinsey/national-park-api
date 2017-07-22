Rails.application.routes.draw do
  devise_for :users
  resources :parks
  root to: "park#index"
  post 'auth_user' => 'authentication#authenticate_user'
end
