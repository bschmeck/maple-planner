class Week < ActiveRecord::Base
  extend FriendlyId
  friendly_id :number, use: :finders

  belongs_to :year

  has_many :days, dependent: :destroy

  def self.populate(number, start_date)
    week = create(number: number, start_date: start_date)
    %w{ Monday Tuesday Wednesday Thursday Friday}.each_with_index do |day, i|
      week.days.create(name: day, date: start_date + i.days)
    end

    week
  end

  def prev_week
    year.weeks.find_by(number: number - 1)
  end

  def next_week
    year.weeks.find_by(number: number + 1)
  end
end
