# create profile class
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: %i[show]
  def new
    @profile = current_user.build_profile
  end

  def show; end

  def create
    @profile = current_user.build_profile(profile_params)
    unless @profile.save
      render 'new'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :mobile_no)
  end

  def find_profile
    @profile = Profile.find_by(id: params[:id])
  end
end
