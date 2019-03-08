class BookingsController < ApplicationController
  # collbacks
  before_action :find_booking, only: %i[show]
  def index
    @bookings = Booking.all
    respond_to do |format|
      format.js
    end
  end

  def new
    @booking = current_user.bookings.build
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      UserMailer.booking_successfully(@booking).deliver_now
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show; end

  # this method for select any city and display particular cleaners
  def featching_cleaner
    city = City.find_by(id: params[:city_id])
    @cleaners = city.cleaners if city.present?
  end

  private

  # # permit booking params
  def booking_params
    params.require(:booking).permit(:booking_date, :city_id, :cleaner_id, :email)
  end

  def find_booking
    @booking = Booking.find_by(id: params[:id])
  end
end
