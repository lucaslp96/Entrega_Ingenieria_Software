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

        if  not(Tag.exists?(:content => params[:tag][:content].upcase))    #no se si es necesario ya que está el validates

            if ((params[:tag][:content].length < 4) or (params[:tag][:content].length > 16))

                flash[:notice] = "La etiqueta debe tener de 4 a 16 caracteres."

            else

                if (Tag.create(content: params[:tag][:content].upcase, usos: 0))

                    flash[:notice] = "Creada exitosamente."

                else

                    flash[:notice] = "Problema al crear."

                end

            end

        else

            flash[:notice] = "La etiqueta ya existe."

        end

        redirect_to tags_path

    end

end
