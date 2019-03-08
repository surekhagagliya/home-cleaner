class CleanersController < ApplicationController
  # collbacks
  before_action :find_cleaner, only: %i[show edit update destroy]

  def index
    @cleaners = Cleaner.all
    @cleaner = current_user.cleaners.build
  end

  def create
    @cleaner = current_user.cleaners.new(cleaner_params)
    if @cleaner.save
      respond_to do |format|
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @cleaner.update(cleaner_params)
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    if @cleaner.destroy
      respond_to do |format|
        format.js
      end 
    end
  end

  private

  #  permit cleaner params
  def cleaner_params
    params.require(:cleaner).permit(:first_name, :last_name, :phone_no, :quality_score, city_ids: [])
  end

  def find_cleaner
    @cleaner = Cleaner.find_by(id: params[:id])
  end
end
