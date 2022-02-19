Rails.application.routes.draw do

  root "tests#index"
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get :signup, to: 'users#new'
  #get :login, to: 'sessions#new'
  #delete :logout, to: 'sessions#destroy'

  #resources :users, only: :create
  #resources :sessions, only: :create

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do 
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
