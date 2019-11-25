class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @seller_score = getSellerRating
    @buyer_score = getBuyerRating
    @buyer_listings = getBuyerListings
  end
  
  private
  
    def getBuyerListings
      @user = User.find(params[:id])
      reservations = @user.reservations
      listings = []
      reservations.each { |reservation| listings.push reservation.listing }
      return listings
    end
    
    def getSellerRating
      @user = User.find(params[:id])
      scores = []
      @user.listings.each { |listing| 
        listing.reservations.each { |reservation| 
          listing_ratings = reservation.ratings.find_all { |rating| rating.from_seller == false }
          listing_ratings.each { |rating| scores.push rating.score }
        }
      }
      score = scores.inject{ |sum, el| sum + el }.to_f / scores.size
      if score.to_f.nan? 
        score = 0
      end

      return score
    end
    
    def getBuyerRating
      @user = User.find(params[:id])
      scores = []
      @user.reservations.each { |reservation| 
        reservation_ratings = reservation.ratings.find_all { |rating| rating.from_seller == true }
        reservation_ratings.each { |rating| scores.push rating.score }
      }
      score = scores.inject{ |sum, el| sum + el }.to_f / scores.size
      if score.to_f.nan? 
        score = 0
      end

      return score
    end
end
