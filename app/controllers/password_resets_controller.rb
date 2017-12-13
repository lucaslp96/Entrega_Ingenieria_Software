class PasswordResetsController < ApplicationController

  def new
  end

  def create
  	if (User.exists?(email: params[:password_reset][:email].downcase))
    	flash[:success] = "se envió la contraseña de restauración a su mail"
    	bla = User.where(email: params[:password_reset][:email].downcase).first
    	bla.password = "reset1"
    	bla.password_confirmation = "reset1"
    	bla.save
    	redirect_to root_path
    else
    	flash[:alert] = "el mail provisto no corresponde a un usuario registrado"
    	redirect_to new_password_reset_path
    end
  end

  def edit
  end
end