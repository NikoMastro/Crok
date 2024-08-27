class Dog < ApplicationRecord
  belongs_to :family, optional: true
  has_many :users, through: :family
  has_many :medical_records, dependent: :destroy
  has_many :health_tracks, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many_attached :photos
end
