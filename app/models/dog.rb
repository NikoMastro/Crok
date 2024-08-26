class Dog < ApplicationRecord
  belongs_to :family, optional: true
  has_many :users, through: :family
  has_many :medical_records
  has_many :health_tracks
  has_many :tasks, dependent: :destroy
  has_many_attached :photos
end
