class RentalsController < ApplicationController
    include RentalsHelper
    
    require 'date'
    Time.zone = 'Central Time (US & Canada)'
    before_action :require_user, expect: [:show]
    
    def index
        #@rentals = Rental.all
        if current_user.admin?
            @search_rental = Rental.ransack(params[:q])
            @rentals = @search_rental.result().paginate(page: params[:page], per_page:10)
        else
            @search_rental = current_user.rentals.ransack(params[:q])
            @rentals = @search_rental.result().paginate(page: params[:page], per_page:10)
        end
    end
    
    def show
        @rental = Rental.find(params[:id])
        #Henry: @user = User.find(@rental.user_id)
        @user = @rental.user
    end
    
    def new
        @rental = Rental.new
    end
    
    def create
        user_id = rental_params[:user_id]
        suit_id = rental_params[:suit_id]
        if user_id == ""
            flash[:danger] = "Please select a customer"
            redirect_to new_rental_path(:suit_id => suit_id)
            return
        end
        if Suit.find(suit_id).suitStatus != "Available"
            flash[:danger] = "This suit is not available."
            redirect_to new_rental_path
            return
        end
        user = User.find(user_id)
        if user.available
            @rental = Rental.new(rental_params)
            if @rental.save
                flash[:success] = "#{@rental.suit.appid} was succussfully rented!"
                redirect_to rentals_path
                #Update user&suit status
                #suit = Suit.find(suit_id)
                suit = Suit.find(@rental.suit_id)
                suit.update_attribute(:suitStatus, "Checkedout")
                user.update_attribute(:available, false)
            else
                if @rental.errors.any?
                    @rental.errors.full_messages.each do |msg|
                        flash[:notice] = msg
                    end
                end
                redirect_to new_rental_path(:suit_id => suit_id)
            end
        else
            flash[:danger] = "This user is currently borrowing a suit!"
            redirect_to user
        end
    end
    
    def edit
        @rental = Rental.find(params[:id])
    end
    
    def update
        @rental = Rental.find(params[:id])
        if @rental.update(rental_params)
            flash[:success] = 'The rental was succussfully updated'
            redirect_to rental_path(@rental)
        else
            render :edit
        end
    end
    
    def destroy
        @rental = Rental.find(params[:id])
        User.find(@rental.user_id).update_attribute(:available, true)
        Suit.find(@rental.suit_id).update_attribute(:suitStatus, "Available")
        @rental.destroy
        flash[:success] = 'Rent was deleted!'
        redirect_to rentals_path
        
    end
    
    private

    def rental_params
        params.require(:rental).permit(:pickUpTime, :expectedReturnTime, :returnTime,
                                       :status, :user_id, :suit_id)
    end
        

end