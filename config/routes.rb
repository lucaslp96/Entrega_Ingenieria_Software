Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

	get 'static_views/about', as: "about"

	get 'static_views/contact', as: "contact"

	devise_for :users

	root 'questions#index'

	resources :questions do
		member do
			post 'upvote'
			post 'downvote'
			post 'unvote'
			post 'bestanswer'
			post 'removebestanswer'
		end
		resources :question_comments, except: :index
    end

	resources :question_comments

	resources :users

	resources :answer_comments

  resources :tags

	resources :answers

	resources :answers do
		member do
			post 'upvote'
			post 'downvote'
			post 'unvote'
			end
			resources :answer_comments
    end

    resources :universities do
    end

  resources :password_resets,     only: [:new, :create, :edit, :update]


end
