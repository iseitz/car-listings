# frozen_string_literal: true

Rails.application.routes.draw do
  resources :manufacturers, has_many: :cars
  root to: 'manufacturers#index'
  resources :manufacturers
  resources :cars
  resources :searches
end
