class UniversitiesController < ApplicationController

    def new

        if ((user_signed_in?) and ((current_user.points) >= (Permit.where(action: "administrar universidades").first.required_points)))

            @permitido = "true"

            @uni = University.new

        else

            @permitido = "false"

        end

    end

    def create

        @uni = University.new

        @uni.name = ((params[:university][:name].upcase).delete(' '))

        if  (not(University.exists?(name: @uni.name)))

            if (@uni.save)

                flash[:success] = "Universidad creada exitosamente."

                redirect_to universities_path

            else

                flash[:error] = "Problema al crear."

                render :new

            end

        else

            flash[:alert] = "La universidad que intentó crear ya existe."

            redirect_to universities_path

        end

    end

    def index

        if ((user_signed_in?) and ((current_user.points) >= (Permit.where(action: "administrar universidades").first.required_points)))

            @permitido = "true"

        else

            @permitido = "false"

        end

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