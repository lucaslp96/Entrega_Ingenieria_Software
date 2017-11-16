class QuestionsController < ApplicationController

    def desvotar

        @question = Question.find(params[:id])

        @vote = QuestionVote.where(user_id: current_user.id, question_id: @question.id).first

        @vote.destroy

        @question.votes -= 1

        @question.save

        redirect_to question_path

    end

    def votar

        @question = Question.find(params[:id])

        QuestionVote.create(user_id: current_user.id, question_id: @question.id)

        @question.votes += 1

        @question.save

        redirect_to question_path

    end


    def index	

	@questions = Question.all
	
	@questionMoreVisited = Question.masvisitada

	@tags = Tag.order("usos DESC").first(5)

    end

    def show

        @question = Question.find(params[:id])
	
	@question.visits += 1

	@question.save	

        @answers = @question.answers    #anda por las relaciones

		#@answerscom = 

        #Answer.where("question_id =  " + params[:id])

    end

    def new

	@question = Question.new

    end

    def edit

    end
	
    def create

    	@question = Question.create(user_id: current_user.id, visits: 0, votes: 0, title: params[:question][:title], content: params[:question][:content])

    end

  #  def orderDate
   #	params{orden} : 2
#	redirect_to questions_path
 #   end	
#
 #   def orderVote
  # 	params{orden} : 1
#	redirect_to questions_path
 #   end	

end
