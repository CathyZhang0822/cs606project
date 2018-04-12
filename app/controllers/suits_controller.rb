class SuitsController < ApplicationController
    before_action :set_suit, only: [:edit, :update, :show, :destroy]
    def index
        #@suits = Suit.all
        @search = Suit.ransack(params[:q])
        @suits = @search.result().paginate(page: params[:page],per_page:10)
    end
    def new 
        @suit = Suit.new
    end
    
    def edit
    end
    
    def create
        @suit = Suit.new(suit_params)
        if @suit.save
            #do something
            flash[:notice] = "Suit was succussfully added to the Closet!"
            redirect_to suit_path(@suit)
        else
            render 'new'
        end
    end
    def update
        if @suit.update(suit_params)
            flash[:notice] = "Suit was succussfully updated"
            redirect_to suit_path(@suit)
        else
            render 'edit'
        end
    end
    
    def show
    
    end
    
    def destroy
        @suit.destroy
        flash[:notice] = "Suit was succussfully deleted"
        redirect_to suits_path
    end
    
    private
      def set_suit
          @suit= Suit.find(params[:id])
      end
      
      def suit_params
          params.require(:suit).permit(:appid, :gender, :size, :description, :user_id)
      end
end