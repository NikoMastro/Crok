class Invitation < ApplicationRecord
  has_secure_token :has_secure_token
  belongs_to :user

  validates :receipient_email, presence: true, uniqueness: true
end
