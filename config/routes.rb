Rails.application.routes.draw do
  devise_for :users

  root 'tests#index'

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
