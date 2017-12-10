class UniversitiesController < ApplicationController

    def index

    	@unis = University.all

    	if (params[:search])

       		@search_universities = University.search(params[:search])

      	end

    end

    def show

    	@uni = University.find(params[:id])

    	@questions = Question.all.where(university_id: params[:id])

    end

end