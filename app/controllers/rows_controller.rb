class RowsController < ApplicationController
  before_action :authenticate_user!

  def create
    year_id = params[:year_id]
    year = current_user.years.find_by(id: year_id)
    year ||= current_user.years.find_by(name: year_id)
    year ||= current_user.collaborating_years.find_by(id: year_id)
    year ||= current_user.collaborating_years.find_by(name: year_id)

    raise ActiveRecord::RecordNotFound.new unless year
    name = params[:name]

    if year.rows.where(name: name).any?
      message = { alert: "A row named #{name} already exists." }
    else
      year.rows.create(name: name)
      message = { notice: "Successfully created row #{name}." }
    end

    redirect_back(message.merge(fallback_location: year_week_url(year, year.weeks.first)))
  end
end
