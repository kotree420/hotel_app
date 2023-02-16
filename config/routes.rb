Rails.application.routes.draw do
  get 'booking_results/index'
  # devise_for :users
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  devise_scope :user do
    get 'users/profile', to: 'users/registrations#profile', as: 'edit_user_profile_registration'
    patch 'users/profile_setting', to: 'users/registrations#profile_setting', as: 'edit_user_profile_setting_registration'
    get 'users/account', to: 'users/registrations#account', as: 'edit_user_account_registration'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "searches#index"
  resources :hotels
  resources :booking_results do
    collection do
      post :confirm
    end
  end
  get "search", to: "searches#search"
  get "search_area", to: "searches#search_area"
end
