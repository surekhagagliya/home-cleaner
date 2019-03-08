class UserMailer < ApplicationMailer
  default from: 'gg.surekha.tc@gmail.com'
  def booking_successfully(booking)
    @booking = booking
    @url = "http://localhost:3000/bookings/new"
    mail to: @booking.email, subject: "Your Booking is Confirm...."
  end
end
