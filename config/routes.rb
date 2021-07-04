Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about' => 'homes#about'



  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
   resource  :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]

  scope '(:locale)' do
    resources :books
    resources :users, except: :create do
      member do
        get :followeds, :followers
      end
    end
    resource :user_icons, only: :destroy
    resources :relationships, only: [:create, :destroy]
  end

end
