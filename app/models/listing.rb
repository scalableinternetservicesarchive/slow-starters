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
     TheStudy: 7,
     Cafe1919: 8
   }
   
   enum images:{
     0 => "bruin_plate.jpg",
     1 => "covel.jpg",
     2 => "de_neve.jpg",
     3 => "feast.jpg",
     4 => "bruin_cafe.jpg",
     5 => "rendezvous.jpg",
     6 => "de_neve.jpg",
     7 => "the_study.jpg",
     8 => "cafe_1919.jpg"
   }
end
