class Family < ApplicationRecord
  has_many :users
  has_many :dogs

  validates :name, presence: true
end
