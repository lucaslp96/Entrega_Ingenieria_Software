class AnswersController < ApplicationController

    def upvote

        @answer = Answer.find(params[:id])

        AnswerVote.create(user_id: current_user.id, answer_id: @answer.id, good: true)

        @aux = User.find(@answer.user_id)    #duda sobre si se guarda

        @aux.points += 10

        @aux.save

        @answer.votes += 10

        @answer.save

        redirect_to answer_path

    end

    def downvote

        @answer = Answer.find(params[:id])

        AnswerVote.create(user_id: current_user.id, answer_id: @answer.id, good: false)

        current_user.points -= 1

        @aux = User.find(@answer.user_id)    #duda sobre si se guarda

        @aux.points -= 10

        @aux.save

        @answer.votes -= 10

        @answer.save

        redirect_to answer_path

    end

    def unvote

        @answer = Answer.find(params[:id])

        @vote = AnswerVote.where(user_id: current_user.id, answer_id: @answer.id).first      #sin el .first no anda...

        if (@vote.good == true)

            @answer.votes -= 10

            @aux = User.find(@answer.user_id)    #duda sobre si se guarda

            @aux.points -= 10

            @aux.save

        else

            @answer.votes += 10

            @aux = User.find(@answer.user_id)    #duda sobre si se guarda

            @aux.points += 10

            @aux.save

            current_user.points += 1

        end

        @answer.save

        @vote.destroy

        redirect_to answer_path

    end

    def show

        @answer = Answer.find(params[:id])

        @comments = AnswerComment.where(answer_id: params[:id])    # como seria con las relaciones? .answer_comments    ?

        if ((user_signed_in?) and ((current_user.id) != (@answer.user_id)))      #misma condicion que en la vista, no se si esta bien

            @vote = AnswerVote.where(user_id: current_user.id, answer_id: @answer.id)

        end

    end

    def new
	
	@answer = Answer.new

	@questionid = params[:question]
	byebug
    end

    def create	

	@answer = Answer.new(params.require(:answer).permit(:content))

	@answer.votes = 0

	@answer.question_id = @questionid

	byebug

	q = Question.find(@questionid)

	q.numAanswers += 1

	q.save
    
	if @answer.save
		redirect_to show_question_path(id: @answer.question_id)
	else
		render :new
	end
    end

end
