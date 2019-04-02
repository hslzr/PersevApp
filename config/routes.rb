Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get '/', to: 'pages#index', as: :index
  get '/about', to: 'pages#about', as: :about
  get '/contact', to: 'pages#contact', as: :contact

  resources :projects
end
