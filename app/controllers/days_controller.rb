class DaysController < ApplicationController
  before_action :authenticate_user!

  def items
    day = Day.find(params[:id])
    row = Row.find(params[:row_id])

    ActiveRecord::Base.transaction do
      day.items_for_row(row).destroy_all
      params[:items].lines.each do |line|
        line = line.chomp
        day.items << Item.from_line(line, row) unless line.blank?
      end
    end

    redirect_to year_week_url(day.week.year, day.week)
  end
end
