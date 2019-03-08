# Create Booking Class
class Booking < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :cleaner
  belongs_to :city

  # validations
  validates :city_id, :cleaner_id, :booking_date, :email, presence: true
  validates :booking_date, uniqueness: { scope: :cleaner_id}
  validate :date_time_check?

  # create date time check method for check date and time for available cleaners
  def date_time_check?
    booking_date_time = booking_date.to_datetime
    booking = Booking.where("cleaner_id = ? and booking_date > ?  and booking_date < ?", cleaner_id, booking_date_time - 2.hours, booking_date_time + 2.hours)
    if booking.present?
      errors.add('Sorry', "This Cleaner #{cleaner.first_name} is not available in your select time")
    end
  end
end
