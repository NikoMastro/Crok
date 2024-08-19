class FoodRecommendation < ApplicationRecord
  belongs_to :dog

  validates :dog, presence: true
  validates :food_name, presence: true
  validates :description, presence: true
end
