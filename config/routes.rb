Rails.application.routes.draw do

  get 'clubhouse' => 'posts#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :members
  resources :posts , only: [:new, :create, :index]

end
