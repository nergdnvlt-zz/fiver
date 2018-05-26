class UsersController < ApplicationController
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
    @user = current_user
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
