class CleanersController < ApplicationController
  # collbacks
  before_action :authenticate_user!
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
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def edit; end

  def update
    if @cleaner.update(cleaner_params)
      redirect_to @cleaner
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to cleaners_path if @cleaner.destroy
  end

  private

  # this method for parmit params
  def cleaner_params
    params.require(:cleaner).permit(:first_name, :last_name, :phone_no, :quality_score, city_ids: [])
  end

  def find_cleaner
    @cleaner = Cleaner.find_by(id: params[:id])
  end
end
