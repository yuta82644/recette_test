class Room < ApplicationRecord
  has_many :room_assigns, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  has_many :users, through: :room_assigns
end
