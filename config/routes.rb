Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tools do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show edit update] do
    member do
      patch '/accept', to: 'bookings#accept'
      patch '/decline', to: 'bookings#decline'
      patch '/cancel', to: 'bookings#cancel'
    end
  end
end
