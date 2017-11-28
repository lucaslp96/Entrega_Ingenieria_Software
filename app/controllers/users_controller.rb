class UsersController < ApplicationController

    def show
        @answers = current_user.answers
        @questions = current_user.questions
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
