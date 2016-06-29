Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_for :employers
  # ==================== Login with Linkedin ====================
 match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


  root to: 'pages#home'
resources :posts do
  resources :comments
end



  # ============== employer interface ====================
  namespace :employers do
    resources :jobs
    resources :applications, only: [:index, :show]
    resource :profile, only: [:show, :edit, :update]
  end

  # ============== developer interface ====================
  namespace :developers do
    resource :profile, only: [:show, :edit, :update]
    resources :applications, only: [:index, :show]
  end

  # ====================public interface ============================
  resources :developers, only: [:index, :show]

  resources :jobs, only: [:show, :index] do
    resources :applications, only: [:new, :create]
  end






end
