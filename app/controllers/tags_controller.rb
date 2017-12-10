class TagsController < ApplicationController

    def index

        @tags = Tag.all

        @toptags = Tag.order("usos DESC").first(5)

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

end
