class Rating < ApplicationRecord
  belongs_to :reservation
  
  #validates_uniqueness_of :from_seller
  validates_presence_of :score
  validates_inclusion_of :from_seller, :in => [true, false]
  
end
