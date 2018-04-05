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
            flash[:notice] = "Welcome to Career Closet #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
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