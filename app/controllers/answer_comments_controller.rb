class AnswerCommentsController < ApplicationController
  def new
    @answer_comment = AnswerComment.new
    @answer_original = params[:answer_id]
  end
  def create
    @answer_comment = AnswerComment.create(user_id: current_user.id, answer_id: params[:answer_comment][:answer_id], content: params[:answer_comment][:content])
      redirect_to answer_path(params[:answer_comment][:answer_id])
  end

      def destroy
        @deleted_answer_comment = AnswerComment.destroy(params[:id])
        flash[:success] = "El comentario ha sido borrado."
        redirect_to @deleted_answer_comment.answer
      end
end
