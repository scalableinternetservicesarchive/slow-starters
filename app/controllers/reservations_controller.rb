class ReservationsController < ApplicationController
  before_action :find_listing
  
  def index
    @reservations = @listing.reservations
    @reservation = @listing.reservations.new
  end
  
  def create
    #if Reservation.where(:user_id => params[:user_id], :listing_id => params[:listing_id]).blank?
    if true
      @reservation = @listing.reservations.new(reservation_params)
      if @reservation.save
        @listing.update(swipes_reserved: @listing.swipes_reserved + @reservation.num_reservations)
        redirect_to listing_path(@listing)
      else

      end
      ########################################################################
      # Something
      ########################################################################
    end
    
  end
  
  def new
    @reservation = @listing.reservations.new
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    if current_user.id == @reservation.user_id
      @listing.update(swipes_reserved: @listing.swipes_reserved - @reservation.num_reservations)
      @reservation.destroy
      redirect_to listing_path(@listing)
    end
  end
  
  private
  
    def reservation_params
      params.require(:reservation).permit(:num_reservations, :user_id)
    end
  
    def find_listing
      @listing = Listing.find(params[:listing_id])
    end
    
end