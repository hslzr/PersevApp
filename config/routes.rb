Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get '/', to: 'pages#index', as: :index
  get '/about', to: 'pages#about', as: :about
  get '/contact', to: 'pages#contact', as: :contact

  scope :section do
    get '/:section', to: 'sections#index', as: :section_index

    get '/:section/activities', to: 'events#index', as: :section_events
    get '/:section/activities/:id', to: 'events#index', as: :section_event
  end

end
