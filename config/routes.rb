Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  devise_scope :user do
    root to: "devise/sessions#new"
    patch "users/confirmation", to: "users/confirmations#confirm"
  end

  namespace :admin do
    resources :users
    resources :departments
    resources :books do
      get "search", on: :collection
    end
    resources :lended_histories

    root to: "users#index"
  end

  resources :users
end
