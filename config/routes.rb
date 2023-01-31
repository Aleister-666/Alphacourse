Rails.application.routes.draw do
  root 'pages#home'

  ####################### DEVISE ROUTES ################################

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }


  ####################### ADMINDS ROUTES ###############################
  namespace :admins do
    # get 'users/index', to: 'users#index', as: :users

    resources :users, only: %i[ index show destroy ]
    resources :articles

    resources :courses do
      delete 'unsubscribe/student/:student_id',
       to: 'courses#unsubscribe_student',
       on: :member,
       as: :unsubscribe
       
      resources :sections, except: %i[ show index ], shallow: true
    end


    namespace :courses do
      namespace :modules do
        patch ':id/move', to: 'course_modules#move', as: :move
        delete ':id/destroy', to: 'course_modules#destroy'

        resources :sections, only: [] do
          resources :pages, except: %i[ index ], shallow: true
          resources :quizzes, except: %i[ index ], shallow: true do
            delete :delete_attempts, to: 'quizzes#delete_attempts', on: :member
          end
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
    get 'perfil/:id', to: 'users#show' 
    
    resources :articles, only: %i[ index show ]

    
    namespace :courses do
      namespace :modules do
        resources :pages, only: %i[ show ]
        resources :quizzes, only: %i[ show ] do
        end
      end

      resources :quizzes, module: :quiz, only: [] do
        get :start, to: 'attempts#start'
        post :finish, to: 'attempts#finish'
        get "attempts/:quiz_attempt_id/results", to: 'attempts#results', as: :results_attempt

      end

    end
    
    resources :courses, only: %i[ index show ] do
      post 'inscriptions', to: 'inscriptions#create', as: :inscriptions
      delete 'inscriptions', to: 'inscriptions#destroy'
    end
    get :my_courses, to: 'courses#my_courses'

  end

  ######################### PAGES ROUTES ###################################

  get :about, to: "pages#about"


end
