class TagsController < ApplicationController

    def index

        @tags = Tag.all

        @toptags = Tag.order("usos DESC").first(5)

        @permits = Permit.all

    end

    def show

    end

    def new

        @tag = Tag.new

    end

    def create

        @tag = Tag.new

        @tag.usos = 0

        @tag.content = (((params[:tag][:content].downcase).titleize).delete(' '))       # Twitter hashtag style

        if  (not(Tag.exists?(content: @tag.content)))

            if ((@tag.content.length) < 4)

                flash[:error] = "La etiqueta que intentó crear tenia menos de 4 caracteres."

                render :new

            elsif ((@tag.content.length) > 16)

                flash[:error] = "La etiqueta que intentó crear tenia mas de 16 caracteres."

                render :new

            else

                if (@tag.save)

                    flash[:success] = "Etiqueta creada exitosamente."

                    redirect_to tags_path

                else

                    flash[:error] = "Problema al crear."

                    render :new

                end

            end

        else

            flash[:alert] = "La etiqueta que intentó crear ya existe."

            redirect_to tags_path

        end

    end


        def edit
          @tag = Tag.find(params[:id])
        end

        def update
          @tag = Tag.find(params[:id])
          @tag.update(params.require(:tag).permit(:content, :usos))
          @tag.content = (((params[:tag][:content].downcase).titleize).delete(' '))       # Twitter hashtag style
               if ((@tag.content.length) < 4)
                  flash[:error] = "La etiqueta que intentó crear tenia menos de 4 caracteres."
                  render :edit
              else
                  if ((@tag.content.length) > 16)
                    flash[:error] = "La etiqueta que intentó crear tenia mas de 16 caracteres."
                    render :edit
                  else
                      if (@tag.save)
                        flash[:success] = "Etiqueta modificada exitosamente."
                        redirect_to tags_path
                      else
                        flash[:error] = "La etiqueta que intentó crear ya existe."  #si llego a este punto el único error que puede haber es que ya exista la etiqueta
                        render :edit
                      end
                  end
              end
            end

        def destroy
           @deleted_tag = Tag.destroy(params[:id])
           flash[:success] = "La etiqueta ha sido borrada."
    	     redirect_to tags_path
        end
end
