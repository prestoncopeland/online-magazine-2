Rails.application.routes.draw do

  root to: 'articles#index'

  resources :visitors, only: [:new, :create]

  resources :articles do
    resources :photos
  end

  resources :tags

end
