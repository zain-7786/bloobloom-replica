# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, except: %i[new edit], defaults: { format: 'json' } do
    namespace :admin do
      resources :frames, only: %i[index create update destroy]
      resources :lenses, only: %i[index create update destroy]
      resources :users, only: %i[index create update destroy]
    end

    namespace :user do
      resources :glasses, only: %i[index create update destroy]
      resources :users, only: %i[index create update destroy]
    end
  end
end
