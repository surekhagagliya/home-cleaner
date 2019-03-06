class Profile < ApplicationRecord
  belongs_to :user

  #validations
  validates :first_name, :last_name, :address, presence: true
  validates :mobile_no, numericality: { only_integer: true }
end
