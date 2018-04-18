class SessionController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
   
    if user && user.authenticate(params[:session][:password])
      if user.email_confirmed
        
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:error] = "Please activate your account by confirm your email address"
        render 'new'
      end
    else
      flash[:error] = "Invalid combination of email and password."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

  
end