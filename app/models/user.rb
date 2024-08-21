class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :assign_family

  belongs_to :family, optional: true
  has_many :dogs, through: :family
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  def assign_family
    unless self.family
      family = Family.new
      family.name = "#{name}'s family"
      family.save
      self.family = family
    end
  end

  # validates :family, presence: true
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :encrypted_password, presence: true
end
