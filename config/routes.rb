Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'

  resources :home, only: [:about] do
   collection do
    get 'about'
    end

  end
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
   resources :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end 

  resources :users, only: [:index, :show, :edit, :update]

end
