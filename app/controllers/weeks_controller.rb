class WeeksController < ApplicationController
  before_action :authenticate_user!

  def show
    year_id = params[:year_id]
    year = current_user.years.find_by(id: year_id)
    year ||= current_user.years.find_by(name: year_id)
    year ||= current_user.collaborating_years.find_by(id: year_id)
    year ||= current_user.collaborating_years.find_by(name: year_id)

    raise ActiveRecord::RecordNotFound.new unless year

    @week = year.weeks.find(params[:id])
    @rows = year.rows
  end
end
