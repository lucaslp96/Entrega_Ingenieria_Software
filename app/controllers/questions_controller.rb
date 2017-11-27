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
	   
		@questionMoreVisited = Question.masvisitada

	   	@questionMoreVoted = Question.masvotada

		@questionMoreAnswers = Question.masrespuestas
	
	   end		

	   @tags = Tag.order("usos DESC").first(5)

	   #para el buscador
      	   if params[:search]
        	@search_questions = Question.search(params[:search]).order("created_at DESC")
      	   end

  end


  def show

	@question = Question.find(params[:id])

        @comments = @question.question_comments

	@question.visits += 1

	@question.save

        @answers = @question.answers

        @tags_pregunta=@question.tags

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
  	@question.votes=0
  	@question.visits=0
	@question.numanswers=0
  		  if @question.save
  		#create(user_id: current_user.id, title: params[:question][:title], content: params[:question][:content], visits: 0, votes: 0)    #cambio
             redirect_to questions_path
  		  else
  		        render :new
  		  end
  end

end
