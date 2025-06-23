Rails.application.routes.draw do
  namespace :api do
    # Reveal health status on /api/up
    get "up" => "rails/health#show", as: :rails_health_check

    resources :chat_rooms, only: [:index, :show, :create] do
      resources :messages, only: [:index, :create]
    end

    resources :users, only: [:create]
  end

  mount ActionCable.server => '/cable'
end
