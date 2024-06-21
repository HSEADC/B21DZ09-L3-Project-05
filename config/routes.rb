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

      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        post "sign_out", to: "sessions#destroy"
      end
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

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }


  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/support'
  get 'welcome/search'

  root "welcome#index"
end
