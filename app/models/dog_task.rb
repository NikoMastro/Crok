class DogTask < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  validates :dog, presence: true
  validates :user, presence: true
  validates :task, presence: true
  validates :status, presence: true
end
