class MedicalRecord < ApplicationRecord
  belongs_to :dog
  has_many_attached :pictures

end
