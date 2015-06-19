Rails.application.routes.draw do

  mount Payola::Engine => '/payola', as: :payola
  root to: 'articles#home'

  devise_for :users
  resources :users
  resources :events
  resources :visitors, only: [:new, :create]

  get 'articles/sort/:category' => 'articles#sort', as: 'articles_sort'

  resources :articles do
    resources :photos
  end

  resources :tags
end
