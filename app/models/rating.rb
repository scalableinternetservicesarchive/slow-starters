class Rating < ApplicationRecord
  belongs_to :reservation
  
  validates_presence_of :score
  validates_inclusion_of :from_seller, :in => [true, false]
  
  validate :score_between_one_and_five
  validate :unique_from_seller
  
  def score_between_one_and_five
    if self.score == nil or self.score > 5 or self.score < 1
      self.errors.add(:score, "Score is not a valid value") 
    end
  end
  
  def unique_from_seller
    @reservation = Reservation.find(self.reservation_id)
    @ratings = @reservation.ratings
    if @ratings.find_all{|rating| rating.from_seller == self.from_seller }.empty? == false
      self.errors.add(:from_seller, "This user has already rated") 
    end
  end
end
