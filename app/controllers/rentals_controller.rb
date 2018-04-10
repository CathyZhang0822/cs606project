class RentalsController < ApplicationController
    include RentalsHelper
    require 'date'
    def index
        @rentals = Rental.all
    end
    
    def show
    end
    
    def new
        @rental = Rental.new
    end
    
    def create
        @rental = Rental.new(params[:rental])
        if @rental.save
            flash[:success] = "#{@rental.suit.appid} has been rented!"
            redirect_to rentals_path
        else
            flash[:danger] = "Some problem prevented the movie from being rented."
            render 'rentals/new'
        end
    end
    
    def edit
        @rental = Rental.find(params[:id])
    end
    
    def update
        @rental = Rental.find(params[:id])
        if @rental.update(rental_params)
            flash[:success] = 'The rental was succussfully updated'
            redirect_to rental_path(@rentals)
        else
            render :edit
        end
    end
    
    def destroy
        
    end
    
    private

    def rental_params
        params.require(:rental).permit(:pickUpTime, :expectedReturnTime, :returnTime,
                                       :status, :user_id, :suit_id)
    end
        

end