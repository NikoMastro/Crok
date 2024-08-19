class MedicalRecord < ApplicationRecord
  belongs_to :dog

  validates :dog, presence: true
  validates :record_type, presence: true
  validates :description, presence: true
end
