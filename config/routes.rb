Rails.application.routes.draw do
  post 'support/request_support'

  resources :posts do
    collection do
      get "by_tag/:tag", to: "posts#by_tag", as: "tagged"
    end
  end

  resources :idea_posts do
    collection do
      get "by_tag/:tag", to: "idea_posts#by_tag", as: "tagged"
    end
  end

  resources :tutorial_posts do
    collection do
      get "by_tag/:tag", to: "tutorial_posts#by_tag", as: "tagged"
    end
  end
  
  resources :comments, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :comments
      resources :posts
    end
  end


  namespace :admin do
    resources :idea_posts do
      collection do
        get "by_tag/:tag", to: "idea_posts#by_tag", as: "tagged"
      end
    end

    resources :tutorial_posts do
      collection do
        get "by_tag/:tag", to: "tutorial_posts#by_tag", as: "tagged"
      end
    end

    resources :posts do
      
      resources :comments

      collection do
        get "by_tag/:tag", to: "posts#by_tag", as: "tagged"
      end
      
    end

    resources :comments
    resources :subscriptions

    root to: "admin/posts#index"
  end

  resources :subscriptions, only: [:create, :show]

  devise_for :users


  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/support'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
