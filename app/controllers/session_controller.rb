class SessionController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
   
    if user && user.authenticate(params[:session][:password])
      if user.email_confirmed
        #We want to user unique generate_token and cookie instead of session
        #session[:user_id] = user.id
        if params[:remember_me]
          cookies.permanent[:auth_token] = user.auth_token
        else
          cookies[:auth_token] = user.auth_token
        end
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
    #session[:user_id] = nil
    cookies.delete(:auth_token)
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

  
end