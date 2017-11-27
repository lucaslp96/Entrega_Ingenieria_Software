Rails.application.routes.draw do

	resources:users

	get 'static_views/about', as: "about"

	get 'static_views/contact', as: "contact"

	devise_for :users

	root 'questions#index'

	resources:questions do
		member do
			post 'upvote'
			post 'downvote'
			post 'unvote'
		end

	resources:question_comments, except: :index
    end

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
