# create city model
class City < ApplicationRecord
  # associations
  belongs_to :user
  has_and_belongs_to_many :cleaners, dependent: :destroy
  has_many :bookings, dependent: :destroy

  #validations
  validates :name, presence: true
end