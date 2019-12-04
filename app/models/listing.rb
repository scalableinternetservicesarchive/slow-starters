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
     0 => "https://i.imgur.com/h54RWvm.jpg",
     1 => "https://i.imgur.com/uQFxGRI.jpg",
     2 => "https://i.imgur.com/0wxAM5k.jpg",
     3 => "https://i.imgur.com/bWwYe93.jpg",
     4 => "https://i.imgur.com/iH56lGH.jpg",
     5 => "https://i.imgur.com/6XF7qW1.jpg",
     6 => "https://i.imgur.com/0wxAM5k.jpg",
     7 => "https://i.imgur.com/3ZfygfP.jpg",
     8 => "https://i.imgur.com/esu8IE0.jpg"
   }
end
