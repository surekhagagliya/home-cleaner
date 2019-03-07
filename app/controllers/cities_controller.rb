class CitiesController < ApplicationController
  # collbacks
  before_action :authenticate_user!
  before_action :find_city, only: %i[edit update destroy]

  def index
    @cities = City.all
    @city = current_user.cities.build
  end

  def create
    @city = current_user.cities.build(city_params)
    if @city.save
      respond_to do |format|
        format.js
      end
    end
  end

  def edit; end

  def update
    if @city.update(city_params)
      redirect_to @city
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to cities_path if @city.destroy
  end

  private

  # this method for parmit params
  def city_params
    params.require(:city).permit(:name)
  end

  def find_city
    @city = City.find_by(id: params[:id])
  end
end
