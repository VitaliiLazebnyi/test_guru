# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'tests#index'

  resources :tests, only: :index, shallow: true do
    resources :questions, except: %i[index show]
  end

  resources :test_passages, only: %i[show update] do
    member do
      post :start, to: 'test_passages#create'
      post :gist
      get  :result
    end
  end

  namespace :admin do
    resources :tests, shallow: true do
      patch :update_inline, on: :member
      resources :questions, except: %i[index show]
    end
    resources :gists, only: :index
  end
end
