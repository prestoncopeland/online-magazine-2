Rails.application.routes.draw do

  get 'visitors/new'

  root to: 'articles#index'

  resources :articles do
    resources :photos
  end

  resources :tags

end
