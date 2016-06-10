require 'api_constraints'

Rails.application.routes.draw do
  
  # namespace :api, defaults: {format: 'json'} do 
  # 	namespace :v1 do 
  # 		resources :products
  # 	end
  # end

  # namespace :api, defaults: {format: 'json'} do 
  # 	namespace :v2 do 
  # 		resources :products
  # 	end
  # end

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :products
    end
    scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
      resources :products
    end
  end
  resources :products 
  # resources :categories 
  root to: 'products#index'
end
