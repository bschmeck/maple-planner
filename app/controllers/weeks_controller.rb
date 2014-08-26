class WeeksController < ApplicationController
  before_action :authenticate_user!

  def show
    @week = current_user.years.find(params[:year_id]).weeks.find(params[:id])
  end
end
