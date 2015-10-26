class UsersController < ApplicationController

  def show # 追加
    @user = User.find(params[:id])
    @microposts = @user.microposts #add L7.8.5
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
 # Added the above lines  L7.6.5

 # Added the below lines  L7.7.task1
  def edit
      @user=User.find(params[:id])
  end

  def update
      @user=User.find(params[:id])
    if @user.update(user_params)
        flash[:success] =  "Updated your profile!"
       redirect_to @user 
    else
      render 'edit'
    end
    
  end
 # Added the above lines  L7.7.task1


 # Added the below lines  L7.9.task2
 def followings
  #フォローしているユーザーを表示するメソッド
  @user = User.find(params[:id])
  @users = @user.following_users
 end
 
 def followers
  #フォローされているユーザーを表示するメソッド
  @user = User.find(params[:id])
  @users = @user.follower_users
 end

 # Added the above lines  L7.9.task2
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:area,:profile)
  end
end
