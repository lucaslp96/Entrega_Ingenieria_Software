class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @answers = User.find(params[:id]).answers
        @questions = User.find(params[:id]).questions
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(params.require(:user).permit(:name, :university_id))
      redirect_to user_path(@user)
    end

end
