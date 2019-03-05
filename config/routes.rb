Rails.application.routes.draw do
  get 'register' => 'users#new'
  post 'register' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  resources :games, only: [:new, :create, :show] do
  end
  resources :boards, only: [] do
    post '/move/:position' => 'board_moves#create', as: :move
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
