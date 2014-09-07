class RowsController < ApplicationController
  before_action :authenticate_user!

  def create
    year = current_user.years.find(params[:year_id])
    name = params[:name]

    if year.rows.where(name: name).any?
      message = { alert: "A row named #{name} already exists." }
    else
      year.rows.create(name: name)
      message = { notice: "Successfully created row #{name}." }
    end

    redirect_to :back, message
  end
end
