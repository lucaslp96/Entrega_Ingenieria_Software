class QuestionsController < ApplicationController

    def index

        @questions = Question.all

    end

    def show

        @question = Question.find(params[:id])

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

    	@question = Question.create(user_id: current_user.id, title: params[:question][:title], content: params[:question][:content])
	
   
    end	
	

end

##un user puede responder su preg y en la preg hay que mostrar todo lo relacionado
