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

end

##un user puede responder su preg y en la preg hay que mostrar todo lo relacionado
