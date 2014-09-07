class WeeksController < ApplicationController
  before_action :authenticate_user!

  def show
    year = current_user.years.find(params[:year_id])
    @week = year.weeks.find(params[:id])
    @rows = year.rows
  end
end
