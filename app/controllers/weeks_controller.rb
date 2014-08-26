class WeeksController < ApplicationController
  before_action :authenticate_user!

  def show
    year = current_user.years.find(params[:year_id])
    raise ActiveRecord::RecordNotFound.new unless year

    @week = year.weeks.find(params[:id])
  end
end
