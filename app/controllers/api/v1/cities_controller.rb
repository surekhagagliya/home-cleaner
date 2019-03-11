class Api::V1::CitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  # collbacks
  before_action :find_city, only: %i[show update destroy]
  before_action :find_user, only: %i[create update destroy show ]

  def index
    @cities = City.all
    render json: @cities
  end

  def show
    render json: @city
  end 

  def create
    @city = @user.cities.create!(city_params)
    render json: @city
  end

  def update
    if @city.update(city_params)
      render json: @city
    end
  end

  def destroy
    if @city.destroy
      render json: @city
    end
  end

  private

  # permit city params
  def city_params
    params.permit(:name)
  end

  def find_city
    @city = City.find_by(id: params[:id])
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end
end
