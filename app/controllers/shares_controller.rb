class SharesController < ApplicationController
  def show
    @share = Share.find_by_code!(params[:id])
    year = @share.year
    raise ActiveRecord::RecordNotFound.new unless year

    if params[:week]
      @week = year.weeks.find(params[:week])
    else
      @week = year.week_for(Date.today)
      @week ||= year.weeks.order(:number).first
    end
    @rows = year.rows
  end
end
