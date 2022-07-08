Rails.application.routes.draw do
  get 'my_forms/index'
  resources :forms do
    resources :responses, except: [:edit, :update] do
      resources :response_states, only: [:create]
    end
  end
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
