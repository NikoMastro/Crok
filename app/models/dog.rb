class Dog < ApplicationRecord
  belongs_to_many :users
  has_many :user_interactions, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :dog_tasks, dependent: :destroy
  has_many :medical_records, dependent: :destroy
  has_many :food_recommendations, dependent: :destroy
  has_one_attached :photo

  validates :user, presence: true
  validates :name, presence: true
end
