# Create Profile Class
class Profile < ApplicationRecord
  # associations
  belongs_to :user

  #validations
  validates :first_name, :last_name, :address, :mobile_no, presence: true
  validates :mobile_no, numericality: { only_integer: true }
end
