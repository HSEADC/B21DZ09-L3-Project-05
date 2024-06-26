Rails.application.routes.draw do

  resources :ideas do
    collection do
      get "by_tag/:tag", to: "ideas#by_tag", as: "tagged"
    end
  end

  resources :tutorials do
    collection do
      get "by_tag/:tag", to: "tutorials#by_tag", as: "tagged"
    end

    resources :ideas, only: [:new, :create]

    member do
      get :link_existing_idea  # Display the form for linking
      post :link_idea           # Handle the form submission
    end
  end

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
  resources :poly_comments, only: [:create]

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
    resources :poly_comments
    
    resources :subscriptions

    root to: "admin/posts#index"
  end

  resources :subscriptions, only: [:create, :show]

  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/support'
  get 'welcome/search'

  root "welcome#index"
end
