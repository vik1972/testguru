Rails.application.routes.draw do

  root "tests#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
             controllers: {sessions: "sessions"} ,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout  }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do 
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: %i[show index]
    
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :feedbacks, only: %i[new create]
end
