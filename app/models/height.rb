class Height < ApplicationRecord
  belongs_to :dog

  validates :height, presence: true
end
