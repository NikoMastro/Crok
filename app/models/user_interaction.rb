class UserInteraction < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  validates :user, presence: true
  validates :dog, presence: true
  validates :event_name, presence: true
  validates :event_type, presence: true
end
