Rails.application.routes.draw do
  root 'pages#home'

  ####################### DEVISE ROUTES ################################

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }



  ####################### ADMINDS ROUTES ###############################
  namespace :admins do
    resources :courses do
      resources :sections, except: %i[ show index ], shallow: true
    end


    namespace :courses do
      namespace :modules do
        patch ':id/move', to: 'course_modules#move', as: :move
        delete ':id/destroy', to: 'course_modules#destroy'

        resources :sections, only: [] do
          resources :pages, except: %i[ index ], shallow: true
          resources :quizzes, except: %i[ index ], shallow: true
        end


        resources :quizzes, only: [], module: 'quizzes' do
          resources :questions, except: %i[ index ], shallow: true
        end


        scope :questions, module: 'quizzes' do
          patch ":id/move", to: 'questions#move', as: :move_question
        end
      end
    end
  end


  ######################### STUDENTS ROUTES ###############################
  namespace :students do
    resources :courses, only: %i[ index show ] do
      post 'inscriptions/:user_id', to: 'inscriptions#create', as: :inscriptions
      delete 'inscriptions/:user_id', to: 'inscriptions#destroy'
    end
    get :my_courses, to: 'courses#my_courses'

  end


end
