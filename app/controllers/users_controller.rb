class UsersController < ApplicationController

  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
	@user = User.new
  end

 # Added the below lines  L7.6.5
  def create
    @user = User.new(user_params)
    if @user.save
        flash[:success] = "Welcome to the Sample App!"  #add L7.6.8
	redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
