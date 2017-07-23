Rails.application.routes.draw do
  concern :api_base do
    devise_for :users
    resources :parks
    root to: "park#index"
    post 'auth_user' => 'authentication#authenticate_user'
  end

  namespace :v1 do
    concerns :api_base
  end
end
