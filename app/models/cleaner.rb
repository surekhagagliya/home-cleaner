# Create Cleaner Class
class Cleaner < ApplicationRecord
  # associations
  belongs_to :user
  has_and_belongs_to_many :cities, dependent: :destroy
  has_many :bookings, dependent: :destroy

  #validations
  validates :first_name, :last_name, :phone_no, presence: true
  validates :phone_no, length: { is: 10 }
end
