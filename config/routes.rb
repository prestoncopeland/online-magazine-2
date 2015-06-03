Rails.application.routes.draw do

  root to: 'articles#index'

  resources :visitors, only: [:new, :create]

  get 'articles/sort/:category' => 'articles#sort'

  resources :articles do
    resources :photos
  end

  resources :tags

end
