class QuestionsController < ApplicationController

    def desvotar

        @question = Question.find(params[:id])

        @vote = QuestionVote.where(user_id: current_user.id, question_id: @question.id).first

        @vote.destroy

        @question.votes -= 1

        @question.save

        redirect_to question_path

    end

    def votar

        @question = Question.find(params[:id])

        QuestionVote.create(user_id: current_user.id, question_id: @question.id)

        @question.votes += 1

        @question.save

        redirect_to question_path

    end


    def index

	if (params[:sort].present?)
		if (params[:sort] == "fecha")
			@questions = Question.porfecha
		end
		if (params[:sort] == "votos")
			@questions = Question.porvotos
		end
		if (params[:sort] == "visitas")
			@questions = Question.porvisitas
		end		
	else
		@questions = Question.porfecha
	end
	
	@questionMoreVisited = Question.masvisitada

	@questionMoreVoted = Question.masvotada

	@tags = Tag.order("usos DESC").first(5)

    end

    def show

        @question = Question.find(params[:id])
	
	@question.visits += 1

	@question.save	

        @answers = @question.answers    

	if (user_signed_in?)

            @vote = QuestionVote.where(user_id: current_user.id, question_id: @question.id)

        end

    end

    def new

	@question = Question.new

    end

    def edit

    end
	

    def create

    	@question = Question.create(user_id: current_user.id, visits: 0, votes: 0, title: params[:question][:title], content: params[:question][:content])

    end

end
