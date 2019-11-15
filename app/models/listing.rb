class Listing < ApplicationRecord
  belongs_to :user
  
  has_many :messages
  has_many :reservations
  
   enum locations:{
     BPlate: 0,
     Covel: 1, 
     DeNeve: 2, 
     Feast: 3 , 
     BCafe: 4, 
     Rendezvous: 5, 
     LateNight: 6, 
     TheStudy: 7
   }
end
