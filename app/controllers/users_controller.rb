class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @seller_score = getSellerRating
    @buyer_score = getBuyerRating
  end
  
  private
    
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
