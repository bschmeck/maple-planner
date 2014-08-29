class YearsController < ApplicationController
  before_action :authenticate_user!

  def index
    @years = current_user.years.order("created_at DESC")
    @year = Year.new
  end

  def create
    name = params[:name]
    err = "Name cannot be blank" if name.blank?

    number_of_weeks = params[:number_of_weeks]
    if number_of_weeks.blank?
      err = "Number of weeks cannot be blank"
    elsif number_of_weeks =~ /^\d*$/
      number_of_weeks = number_of_weeks.to_i
    else
      err = "Number of weeks must be a number"
    end

    start_date = params[:start_date]
    if start_date.blank?
      err = "Start date cannot be blank"
    else
      begin
        start_date = Date.parse(start_date)
      rescue ArgumentError => ex
        err = "Invalid format for start date"
      end
    end

    @year = Year.populate(current_user, name, number_of_weeks, start_date) unless err

    if @year && @year.persisted?
      redirect_to year_week_url(@year, @year.weeks.first)
    else
      err ||= "Unable to create school year"
      redirect_to :back, alert: err
    end
  end
end
