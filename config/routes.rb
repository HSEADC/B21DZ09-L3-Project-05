Rails.application.routes.draw do
  resources :posts

  resources :comments, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments
      end
    end
  end


  namespace :admin do
    resources :posts do
      resources :comments
    end

    resources :categories
    resources :comments
    resources :subscriptions

    root to: "admin/posts#index"
  end

  resources :subscriptions, only: [:create, :show]

  devise_for :users


  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/ideas'
  get 'welcome/tutorials'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
