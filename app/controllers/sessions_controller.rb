class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    # user = from_omniauth
    if user
      session[:user_id] = user.id
      redirect_to user_path(user.slug)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  # private
  #
  # def from_omniauth
  #   if request.env['omniauth.auth']
  #     user = User.from_omniauth(request.env["omniauth.auth"])
  #     binding.pry
  #   else
  #     User.find_by(username: params[:username])
  #   end
  # end
end
