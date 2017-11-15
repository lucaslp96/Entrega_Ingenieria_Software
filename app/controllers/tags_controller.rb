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

        if  not(Tag.exists?(:content => params[:tag][:content]))

            if (Tag.create(content: params[:tag][:content], usos: 0))

                flash[:notice] = "Creada exitosamente."

            else

                flash[:notice] = "Problema al crear"

            end

        else

            flash[:notice] = "La etiqueta ya existe."

        end

        redirect_to tags_path

    end

end
