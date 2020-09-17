Rails.application.routes.draw do
  root "static_pages#home"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  devise_scope :user do
    patch "users/confirmation", to: "users/confirmations#confirm"
  end

  namespace :admin do
    resources :users

    root to: "users#index"
  end

  resources :users
end
