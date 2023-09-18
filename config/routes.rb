Rails.application.routes.draw do
  
  devise_for :users
  get 'mcds/:mcd_id/likes' => 'likes#create'
  get 'mcds/:mcd_id/likes/:id' => 'likes#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :mcds do
    resources :likes, only: [:create, :destroy]
  end
  root 'mcds#index'
  get 'blogs/index'
  resources :blogs
end
