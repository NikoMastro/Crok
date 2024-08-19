class Task < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :status, presence: true
end
