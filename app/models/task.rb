class Task < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  has_many :comments
  has_one :family, through: :user
end
