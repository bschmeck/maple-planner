class YearsController < ApplicationController
  before_action :authenticate_user!

  def index
    @years = current_user.years.order("created_at DESC")
  end
end
