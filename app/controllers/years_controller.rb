class YearsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_year, except: [:index, :create]

  def index
    @years = current_user.years
    @years += current_user.collaborating_years
    @years.sort_by!(&:created_at)
    @year = Year.new
  end

  def show
    week = @year.week_for(Date.today)
    week ||= @year.weeks.order(:number).first

    redirect_to year_week_url(@year, week)
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
      redirect_back(fallback_location: root_url, alert: err)
    end
  end

  def for_date
    begin
      date = Date.parse(params[:date])
    rescue ArgumentError
      redirect_back(fallback_location: year_week_url(@year, @year.weeks.first), alert: "Invalid date format") and return
    end

    week = @year.week_for(date)
    if week
      redirect_to year_week_url(@year, week)
    else
      redirect_back(fallback_location: year_week_url(@year, @year.weeks.first), alert: "Unable to find week for that date")
    end
  end

  def extend
    begin
      number_of_weeks = params[:number_of_weeks].to_i if params[:number_of_weeks]
    rescue ArgumentError
    end
    redirect_back(fallback_location: year_week_url(@year, @year.weeks.first), alert: "Invalid number of weeks") and return unless number_of_weeks

    @year.extend(number_of_weeks)

    redirect_back(fallback_location: year_week_url(@year, @year.weeks.first), alert: "Successfully extended year by #{number_of_weeks} weeks")
  end

  private
  def find_year
    year_id = params[:id]
    @year = current_user.years.find_by(id: year_id)
    @year ||= current_user.years.find_by(name: year_id)
    @year ||= current_user.collaborating_years.find_by(id: year_id)
    @year ||= current_user.collaborating_years.find_by(name: year_id)

    raise ActiveRecord::RecordNotFound.new unless @year
  end
end
