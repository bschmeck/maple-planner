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
    @days = @week.days.order(:date)
    @rows = year.rows
    @items = Item.where(row: @rows, day: @days).group_by(&:row_id)
  end
end
