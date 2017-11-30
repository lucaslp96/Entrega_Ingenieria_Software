class TagsController < ApplicationController

    def index

        @tags = Tag.all

    end

    def show

    end

    def new

        @tag = Tag.new

    end

    def create

        @tag = Tag.new

        if  not(Tag.exists?(:content => params[:tag][:content].upcase))    #no se si es necesario ya que está el validates

            if (params[:tag][:content].length < 4)

                flash[:error] = "La etiqueta que intentó crear tenia menos de 4 caracteres."

                render :new

            elsif (params[:tag][:content].length > 16)

                flash[:error] = "La etiqueta que intentó crear tenia mas de 16 caracteres."
                
                render :new

            else

                if (Tag.create(content: params[:tag][:content].upcase, usos: 0))

                    flash[:notice] = "Creada exitosamente."

                    redirect_to tags_path

                else

                    flash[:error] = "Problema al crear."

                    render :new

                end

            end

        else

            flash[:notice] = "La etiqueta que intentó crear ya existe."

            redirect_to tags_path

        end

    end

end
