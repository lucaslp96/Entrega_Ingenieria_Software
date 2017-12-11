class AnswersController < ApplicationController

    def upvote

        @answer = Answer.find(params[:id])

        AnswerVote.create(user_id: current_user.id, answer_id: @answer.id, good: true)

        @aux = User.find(@answer.user_id)    #duda sobre si se guarda

        @aux.points += 10

        @aux.save

        @answer.votes += 1

        @answer.save

        redirect_to answer_path

    end

    def downvote

        @answer = Answer.find(params[:id])

        AnswerVote.create(user_id: current_user.id, answer_id: @answer.id, good: false)

        current_user.points -= 1

        @aux = User.find(@answer.user_id)    #duda sobre si se guarda

        @aux.points -= 2

        @aux.save

        @answer.votes -= 1

        @answer.save

        redirect_to answer_path

    end

    def unvote

        @answer = Answer.find(params[:id])

        @vote = AnswerVote.where(user_id: current_user.id, answer_id: @answer.id).first      #sin el .first no anda...

        if (@vote.good == true)

            @answer.votes -= 1

            @aux = User.find(@answer.user_id)    #duda sobre si se guarda

            @aux.points -= 10

            @aux.save

        else

            @answer.votes += 1

            @aux = User.find(@answer.user_id)    #duda sobre si se guarda

            @aux.points += 2

            @aux.save

            current_user.points += 1

        end

        @answer.save

        @vote.destroy

        redirect_to answer_path

    end

    def show
        @permits = Permit.all

        @answer = Answer.find(params[:id])

        @comments = AnswerComment.where(answer_id: params[:id])    # como seria con las relaciones? .answer_comments    ?

        if ((user_signed_in?) and ((current_user.id) != (@answer.user_id)))      #misma condicion que en la vista, no se si esta bien

            @vote = AnswerVote.where(user_id: current_user.id, answer_id: @answer.id)

        end

    end

    def new
        @question_original = params[:question]
        @answer = Answer.new
    end
    def create

      @answer = Answer.create(user_id: current_user.id, question_id: params[:answer][:question_id], content: params[:answer][:content], votes: "0")
	     q = Question.find(params[:answer][:question_id])
	      q.numanswers += 1
	       q.save
         redirect_to question_path(params[:answer][:question_id])

    end

    def destroy
      @deleted_answer = Answer.destroy(params[:id])
      flash[:success] = "Tu respuesta ha sido borrada."
      redirect_to @deleted_answer.question
    end

end
