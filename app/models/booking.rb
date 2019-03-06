class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cleaner
  belongs_to :city

  # validations
  validates :city_id, :cleaner_id, :booking_date, presence: true

  validate :date_time_check

  def date_time_check
    binding.pry
  end
end
