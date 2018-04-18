class UsersController < ApplicationController
    def index
        #@users = User.all
        @search_user = User.ransack(params[:q])
        @users = @search_user.result().paginate(page: params[:page], per_page:5)
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.registration_confirmation(@user).deliver_now
            flash[:success] = "Please confirm your email address to continue"
            redirect_to root_url
            #session[:user_id] = @user.id
            #flash[:notice] = "Welcome to Career Closet #{@user.username}"
            #redirect_to user_path(@user)
        else
            flash[:error] = "Oooops, something went wrong!"
            render 'new'
        end
    end
    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            flash[:success] = "Welcome to Career Closet! Your email has been confirmed."
            redirect_to login_url
        else
            flash[:error] = "Sorry. User does not exit"
            redirect_to root_url
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            #flash[:success] = "Your account was updated successfully"
            redirect_to user_path(@user), notice: "Your account was updated successfully"
        else
            render 'edit'
        end
    end
    def show
        @user = User.find(params[:id])
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash.keep[:notice] = "User was succussfully deleted"
        redirect_to users_path
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :UIN, :phone, :email, :password, :password_confirmation)
    end
    
end