class Weight < ApplicationRecord
  belongs_to :dog

  validates :weight, presence: true
end
