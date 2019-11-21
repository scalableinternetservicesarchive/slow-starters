class RatingsController < ApplicationController
  before_action :find_reservation
  
  def index
    @ratings = @reservation.ratings
    @ratings = @reservation.ratings.new
  end
  
  def create
    @rating = @reservation.ratings.new(rating_params)
    if @rating.save
      redirect_to listing_path(@listing)
    end
  end
  
  def new
    @rating = @reservation.ratings.new
  end
  
  private
  
    def rating_params
      params.require(:rating).permit(:from_seller, :score, :comment)
    end
  
    def find_reservation
      @reservation = Reservation.find(params[:reservation_id])
      @listing = Listing.find(@reservation.listing_id)
    end
    
end