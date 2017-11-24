Rails.application.routes.draw do

  get 'static_views/about', as: "about"

  get 'static_views/contact', as: "contact"

    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'questions#index'
    #root 'home#main'
    resources:questions do
      member do
        post 'upvote'
        post 'downvote'
        post 'unvote'
      end
      resources:question_comments, except: :index
    end
	resources:users
    resources:tags
    resources:answers do
        member do
        post 'upvote'
        end
        member do
        post 'downvote'
        end
        member do
        post 'unvote'
        end
    end



end
