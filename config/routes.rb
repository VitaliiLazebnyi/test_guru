Rails.application.routes.draw do
  resources :tests, shallow: true do
    resources :questions, except: [:index, :show]
    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end
end
