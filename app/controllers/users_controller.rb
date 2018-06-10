class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = NativeUser.new
  end

  def create
    @user = NativeUser.new(user_params)
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
    if params[:slug] == current_user.slug
      @user = User.find_by(slug: params[:slug])
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:native_user).permit(:name,
                                        :username,
                                        :email,
                                        :password,
                                        :password_confirmation)
  end
end
