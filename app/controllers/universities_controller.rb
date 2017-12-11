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

    def edit
      @university = University.find(params[:id])
      if ((user_signed_in?) and ((current_user.points) >= (Permit.where(action: "administrar universidades").first.required_points)))

          @permitido = "true"

      else

          @permitido = "false"

      end
    end

    def update
      if ((user_signed_in?) and ((current_user.points) >= (Permit.where(action: "administrar universidades").first.required_points)))

          @permitido = "true"

      else

          @permitido = "false"

      end
      @university = University.find(params[:id])
      @university.update(params.require(:university).permit(:name))
           if ((@university.name.length) < 3)
              flash[:error] = "La universidad que intentó crear tenia menos de 4 caracteres."
              render :edit
          else
              if ((@university.name.length) > 16)
                flash[:error] = "La universidad que intentó crear tenia mas de 16 caracteres."
                render :edit
              else
                  if (@university.save)
                    flash[:success] = "Universidad modificada exitosamente."
                    redirect_to universities_path
                  else
                    flash[:error] = "La universidad que intentó crear ya existe."  #si llego a este punto el único error que puede haber es que ya exista la etiqueta
                    render :edit
                  end
              end
          end
        end
    def destroy
       @deleted_university = University.destroy(params[:id])
       flash[:success] = "La universidad ha sido borrada."
       redirect_to universities_path
    end

end
