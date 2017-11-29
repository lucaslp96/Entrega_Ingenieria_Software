class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @answers = User.find(params[:id]).answers
        @questions = User.find(params[:id]).questions
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
      @user.update(name: params[:name], university_id: params[:university])
      redirect_to edit_user_path(@user)
    end

end
