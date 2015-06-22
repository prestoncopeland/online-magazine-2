Rails.application.routes.draw do

  get 'content/subscribed'

  mount Payola::Engine => '/payola', as: :payola
  root to: 'articles#home'

  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users
  resources :events
  resources :visitors, only: [:new, :create]

  get 'articles/sort/:category' => 'articles#sort', as: 'articles_sort'

  resources :articles do
    resources :photos
    collection do
      get :search
    end
  end

  resources :tags
end
