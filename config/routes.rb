Rails.application.routes.draw do

  root to: 'articles#home'

  resources :visitors, only: [:new, :create]

  get 'articles/sort/:category' => 'articles#sort', as: 'articles_sort'

  resources :articles do
    resources :photos
  end

  resources :tags

end
