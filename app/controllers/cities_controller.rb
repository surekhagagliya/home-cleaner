class CitiesController < ApplicationController
  # collbacks
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

  def edit
    respond_to do |format|
      format.js
    end 
  end

  def update
    if @city.update(city_params)
      respond_to do |format|
        format.js
      end 
    end
  end

  def destroy
    if @city.destroy
      respond_to do |format|
        format.js
      end 
    end
  end

  private

  # permit city params
  def city_params
    params.require(:city).permit(:name)
  end

  def find_city
    @city = City.find_by(id: params[:id])
  end
end
