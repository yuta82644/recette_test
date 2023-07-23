class Recipe < ApplicationRecord
  has_many :procedures, dependent: :destroy
  has_many :cooking_ingredients, dependent: :destroy
  belongs_to :room
  accepts_nested_attributes_for :procedures, allow_destroy: true
  accepts_nested_attributes_for :cooking_ingredients, allow_destroy: true
  belongs_to :user
  attr_accessor :public_post
end