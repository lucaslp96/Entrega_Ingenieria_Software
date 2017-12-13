class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @tags_usuario = @user.tags
        @answers = User.find(params[:id]).answers
        @questions = User.find(params[:id]).questions
        @permits = Permit.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(params.require(:user).permit(:name, :university_id, tag_ids: []))
      redirect_to user_path(@user)
    end

    def destroy
       @deleted_user = User.destroy(current_user.id)
       flash[:success] = "La cuenta ha sido eliminada."
	     redirect_to questions_path
    end

end
