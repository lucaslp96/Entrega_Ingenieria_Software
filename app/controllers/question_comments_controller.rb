class QuestionCommentsController < ApplicationController
  def new
      @question_original = params[:question_id]
      @question_comment = QuestionComment.new
  end
  def create
    @question_comment = QuestionComment.create(user_id: current_user.id, question_id: params[:question_comment][:question_id], content: params[:question_comment][:content])
      redirect_to question_path(params[:question_comment][:question_id])

    end

    def destroy
      @deleted_question_comment = QuestionComment.destroy(params[:id])
      flash[:success] = "El comentario ha sido borrado."
      redirect_to @deleted_question_comment.question
    end

end
