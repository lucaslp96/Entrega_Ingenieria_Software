Rails.application.routes.draw do

	get 'static_views/about', as: "about"

	get 'static_views/contact', as: "contact"

	devise_for :users

	root 'questions#index'

	resources:questions do
		member do
			post 'upvote'
			post 'downvote'
			post 'unvote'
			post 'chooseBestAnswer'
			post 'cancelBestAnswer'
		end
		resources:question_comments, except: :index
    end
		resources :question_comments

		resources:users
		resources :answer_comments
    resources:tags
		resources :answers
		resources:answers do
		member do
			post 'upvote'
			post 'downvote'
			post 'unvote'
			end
			resources :answer_comments
    end

end
