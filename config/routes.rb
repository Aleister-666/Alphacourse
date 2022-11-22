Rails.application.routes.draw do
  root 'pages#home'
  namespace :admins do
    resources :courses do
      resources :sections, except: [ :show ]
    end
  end

  namespace :students do
    resources :courses, only: %w[ index show ] do
      post 'inscriptions/:user_id', to: 'inscriptions#create', as: :inscriptions
      delete 'inscriptions/:user_id', to: 'inscriptions#destroy'
    end
    get :my_courses, to: 'courses#my_courses'
  end

  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
