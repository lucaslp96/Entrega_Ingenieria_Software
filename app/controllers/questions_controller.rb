class QuestionsController < ApplicationController

    def bestanswer

    preg = Question.find(params[:id])

    preg.bestanswer = params[:loque]

    preg.save

    resp = Answer.find(params[:loque])

    usuario = User.find(resp.user_id)

    usuario.points += 20

    usuario.save

    redirect_to question_path

  end

  def removebestanswer

    preg = Question.find(params[:id])

    preg.bestanswer = nil

    preg.save

    resp = Answer.find(params[:loque])

    usuario = User.find(resp.user_id)

    usuario.points -= 20

    usuario.save

    redirect_to question_path

  end

  def upvote

      @question = Question.find(params[:id])

      QuestionVote.create(user_id: current_user.id, question_id: @question.id, good: true)

      @aux = User.find(@question.user_id)

      @aux.points += 5

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

      @aux.points -= 2

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

          @aux.points += 2

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
		 end
		 if (params[:sort] == "votos")
			@questions = Question.porvotos
		 end
		 if (params[:sort] == "visitas")
			@questions = Question.porvisitas
		 end
		 if (params[:sort] == "respuestas")
			@questions = Question.porrespuestas
		 end
		 if (params[:sort] == "respuestasmenor")
			@questions = Question.porrespuestasmenor
		 end
	   else
		   @questions = Question.porfecha
	   end

	   if (Question.nil?) then

	   else

	   	@trending = Question.trending

		@questionMoreVisited = Question.masvisitada

	   	@questionMoreVoted = Question.masvotada

		@questionMoreAnswers = Question.masrespuestas

	   end

	   #para el buscador
      	   if params[:search]
        	@search_questions = Question.search(params[:search]).order("created_at DESC")
      	   end

  end


  def show

    @permits=Permit.all

    @question = Question.find(params[:id])

    if(params[:orden].present?)

      if (params[:orden] == "fecha")

        @answers = @question.answers.porfecha

      elsif (params[:orden] == "votos")

        @answers = @question.answers.porvotos

      else

        @answers = @question.answers.porfecha #no se debería entrar acá

      end

    else

		   @answers = @question.answers.porfecha

    end

    @comments = @question.question_comments

  	@question.visits += 1

  	@question.save

    @tags_pregunta = @question.tags

    @question_comments = @question.question_comments

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
        @question.university_id = current_user.university_id    #hereda el university_id del usuario
        @question.votes=0
        @question.visits=0
      	@question.numanswers=0

  		  if @question.save

  		  	params[:question][:tag_ids].each do |tag|
        		if (tag != '')     #porque uno llega vacio no se que onda
        			Tag.find(tag).update(usos: (Tag.find(tag).usos += 1))
        		end
        	end

            redirect_to questions_path

  		  else

  		        render :new

  		  end

  end

  def destroy
    @deleted_question = Question.destroy(params[:id])
    flash[:success] = "Tu pregunta ha sido borrada."
    redirect_to questions_path
  end

end
