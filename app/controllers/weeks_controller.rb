class WeeksController < ApplicationController
  def show
    @week = Year.find(params[:year_id]).weeks.find(params[:id])
  end
end
