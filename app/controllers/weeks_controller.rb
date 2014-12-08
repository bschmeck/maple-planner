class WeeksController < ApplicationController
  before_action :authenticate_user!

  def show
    year_id = params[:id]
    year = current_user.years.find_by(id: year_id)
    year ||= current_user.collaborating_years.find_by(id: year_id)
    @week = year.weeks.find(params[:id])
    @rows = year.rows
  end
end
