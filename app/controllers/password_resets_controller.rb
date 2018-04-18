class PasswordResetsController < ApplicationController
  before_action :set_user, only:[:create]
  def new
  end
  
  def create
    if @user
      @user.send_password_reset
      flash[:success] = "Email sent with password reset instructions."
      redirect_to root_path
    else
      flash[:danger] = 'Email address not found'
      redirect_to root_path
    end
  end
  
  def edit
    @user = User.find_by_password_reset_token(params[:id])
  end
  
  def update
    @user = User.find_by_password_reset_token(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(user_params)
      flash[:success] = "Password has been reset!"
      redirect_to root_path
    else
      render :edit
    end
      
  end
  
  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  def set_user
    @user = User.find_by_email(params[:email])
  end
end
