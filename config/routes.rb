Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: "homes#top"
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end

    #get 'customers/unsubscribe'
    #patch 'customers/withdraw'

    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

    resources :customers, only: [:show, :edit, :update]
    get 'homes/about'
    get "search" => "searches#search"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: "homes#top"

end
