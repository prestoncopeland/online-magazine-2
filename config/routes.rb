Rails.application.routes.draw do

  root to: 'articles#index'

  resources :articles do
    resources :photos
  end

  resources :tags

end
