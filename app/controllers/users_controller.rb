class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "#{@user.username}'s account created!"
      redirect_to user_path(@user.slug)
    else
      flash[:error] = 'Account Not Created!'
      render :new
    end
  end

  def show
    @user = User.find_by(slug: params[:slug])
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :username,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
