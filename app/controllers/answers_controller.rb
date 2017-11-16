class AnswersController < ApplicationController

    def upvote

        @answer = Answer.find(params[:id])

        AnswerVote.create(user_id: current_user.id, answer_id: @answer.id, good: true)

        @answer.votes += 1

        @answer.save

        redirect_to answer_path

    end

    def downvote

        @answer = Answer.find(params[:id])

        AnswerVote.create(user_id: current_user.id, answer_id: @answer.id, good: false)

        @answer.votes -= 1

        @answer.save

        redirect_to answer_path

    end

    def unvote

        @answer = Answer.find(params[:id])

        @vote = AnswerVote.where(user_id: current_user.id, answer_id: @answer.id).first      #sin el .first no anda...

        if (@vote.good == true)

            @answer.votes -= 1

        else

            @answer.votes += 1

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

end
