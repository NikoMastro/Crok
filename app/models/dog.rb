class Dog < ApplicationRecord
  belongs_to :family
  has_many :tasks, dependent: :destroy
  has_many :medical_records, dependent: :destroy
  has_many :heights
  has_many :weights
  has_one_attached :photo

  validates :family, presence: true
  validates :name, presence: true
end
