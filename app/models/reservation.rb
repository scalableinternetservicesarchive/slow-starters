class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  
  validates_uniqueness_of :user_id, scope: :listing_id
  validates_presence_of :num_reservations,:listing_id, :user_id
  validates_numericality_of :num_reservations, :greater_than => 0
  validate :has_enough_swipes
  validate :is_not_seller
  
  def has_enough_swipes
    @listing = Listing.find(self.listing_id)
    if @listing.available_swipes < @listing.swipes_reserved + self.num_reservations
      self.errors.add(:num_reservations, "Not enough available swipes") 
    end
  end
  
  def is_not_seller
    @listing = Listing.find(self.listing_id)
    if @listing.user_id == self.user_id
      self.errors.add(:user_id, "Can't be seller") 
    end
  end
  
end
