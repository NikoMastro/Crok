class MedicalRecord < ApplicationRecord
  belongs_to :dog
  has_many_attached :photos, dependent: :destroy

  validates :date, presence: true, on: :create
  validates :description, presence: true, on: :create
  validates :vet_contact, presence: true, on: :create
end
