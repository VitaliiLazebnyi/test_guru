Rails.application.routes.draw do
  root 'tests#index'

  get 'users/new'
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  resources :users, only: :create

  resources :tests, shallow: true do
    resources :questions, except: [:index, :show]
  end

  resources :test_passages, only: [:show, :update] do
    member do
      post :start, to: 'test_passages#create'
      get :result
    end
  end
end
