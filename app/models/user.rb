# Create User Class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations
  has_one  :profile
  has_many :cities, dependent: :destroy
  has_many :cleaners, dependent: :destroy
  has_many :bookings, dependent: :destroy

end
