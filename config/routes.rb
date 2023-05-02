Rails.application.routes.draw do
  devise_for :drivers, controllers: { registrations: "drivers/registrations", sessions: "drivers/sessions",
                                      passwords: "drivers/passwords" }
  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: "admins/sessions",
                                     passwords: "admins/passwords" }

  devise_scope :admins do
    get :payments, to: "admins#payments"
    get :user, to: "admins#user"
  end

  root to: "pages#landing"

  resource :admins, only: :show
  resource :users, only: %i[create new]
  resources :drivers, except: %i[edit update create new]
  resources :rides do
    resources :reviews, only: [:new, :create]
    post '/reviews/post', to: 'reviews#post', as: "posts"
  end
  resources :notifies, only: [:create, :destroy]

  resources :reviews

  get "/home", to: "users#home", as: "home"
  get "/calls", to: "drivers#calls", as: "calls"
  get "/services", to: "rides#services", as: "services"
  get "/driver-ride", to: "rides#old_ride_drive", as: "driverides"
  delete "notifies/:id", to: "notifies#destroy"

  get    "users/:id/edit", to: "users#edit", as: :edit_user
  patch  "users/:id",      to: "users#update"

  get "run/:id", to: "rides#run"

end
