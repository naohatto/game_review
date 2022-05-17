Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: "homes#top"
    resources :post_comments, only: [:create, :destroy]
    resources :posts
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    get 'customers/withdraw'
    get 'homes/about'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: "homes#top"

end
