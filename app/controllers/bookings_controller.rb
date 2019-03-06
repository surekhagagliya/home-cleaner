class BookingsController < ApplicationController
  # collbacks
  before_action :authenticate_user!
  before_action :find_booking, only: %i[show]

  def new
    @booking = current_user.bookings.build
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show; end

  def featching_cleaner
    city = City.find_by(id: params[:city_id])
    @cleaners = city.cleaners
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :city_id, :cleaner_id)
  end

  def find_booking
    @booking = Booking.find_by(id: params[:id])
  end
end
