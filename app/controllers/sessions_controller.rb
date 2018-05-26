class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username]) || GoogleUser.from_omniauth(request.env['omniauth.auth'])
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
end
