# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'lists#index'
  post '/', to: 'lists#create'
  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[create]
  end
  resources :bookmarks, only: %i[destroy]
end
