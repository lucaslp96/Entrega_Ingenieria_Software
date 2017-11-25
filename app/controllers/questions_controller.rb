class QuestionsController < ApplicationController

  def upvote

      @question = Question.find(params[:id])

      QuestionVote.create(user_id: current_user.id, question_id: @question.id, good: true)

      @aux = User.find(@question.user_id)

      @aux.points += 10

      @aux.save

      @question.votes += 1

      @question.save

      redirect_to question_path

  end

  def downvote

      @question = Question.find(params[:id])

      QuestionVote.create(user_id: current_user.id, question_id: @question.id, good: false)

      current_user.points -= 1

      @aux = User.find(@question.user_id)

      @aux.points -= 10

      @aux.save

      @question.votes -= 1

      @question.save

      redirect_to question_path

    end

    def unvote

      @question = Question.find(params[:id])

      @vote = QuestionVote.where(user_id: current_user.id, question_id: @question.id).first      #sin el .first no anda... habria que hacer un uniqueness

      if (@vote.good == true)

          @question.votes -= 1

          @aux = User.find(@question.user_id)

          @aux.points -= 10

          @aux.save

      else

          @question.votes += 1

          @aux = User.find(@question.user_id)

          @aux.points += 10

          @aux.save

          current_user.points += 1

      end

        @question.save

        @vote.destroy

        redirect_to question_path

    end

    def index

        if (params[:sort].present?)

            if (params[:sort] == "fecha")

                @questions = Question.porfecha

            elsif (params[:sort] == "votos")

                @questions = Question.porvotos

		    elsif (params[:sort] == "visitas")

                @questions = Question.porvisitas

            else

                @questions = Question.porvisitas   #seria un error creo

            end

        else

            @questions = Question.porfecha

        end

        @questionMoreVisited = Question.masvisitada

        @questionMoreVoted = Question.masvotada

        @tags = Tag.order("usos DESC").first(5)

    end

    def show

        #@comments = Question.question_comments


        @question = Question.find(params[:id])

        @tags_pregunta=@question.tags

        @question.visits += 1

        @question.save

        @answers = @question.answers

        @question_comments=@question.question_comments

        if (user_signed_in?)

            @vote = QuestionVote.where(user_id: current_user.id, question_id: @question.id)

        end

    end

    def new

        @question = Question.new

        @tags=Tag.all

    end

    def edit

    end

    def create

        @question = Question.new(params.require(:question).permit(:title, :content, tag_ids: []))

        @question.user_id = current_user.id

        @question.votes = 0

        @question.visits = 0

        if @question.save

            redirect_to questions_path

        else

            render :new

        end

    end

end
