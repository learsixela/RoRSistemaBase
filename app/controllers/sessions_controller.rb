class SessionsController < ApplicationController
  layout "registro"
  #login requerido
  before_action :require_user_login, only: [:user_destroy]
  def new
  end
  def user_create
    @user = User.find_by_email(params['user'][:email])
    if @user != nil
      if @user.try(:authenticate, params['user'][:password]) == false
        flash[:errors] = "Email o Password erroneo"
        redirect_to login_path
      else
        session[:user_id] = @user.id
        redirect_to users_path #"users#show"
      end
    else
      flash[:errors] = "User no encontrado"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
  def user_destroy
    session[:user_id] = nil
    redirect_to register_path
  end

  private
  def require_user_login
    if session[:user_id] == nil
      redirect_to login_path
    end
  end
end