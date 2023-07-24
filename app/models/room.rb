class Room < ApplicationRecord
  has_many :room_assigns, dependent: :destroy
  
  has_many :users, through: :room_assigns
  has_many :recipes
end
