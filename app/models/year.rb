class Year < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :finders

  has_many :weeks, dependent: :destroy
  has_many :rows, ->{ order(:order) }
  belongs_to :user
  has_many :collaborators, through: :collabortions, class_name: "User", foreign_key: :user_id

  def self.populate(user, name, number_of_weeks, start_date)
    start_date = start_date.beginning_of_week
    year = user.years.create(name: name)
    number_of_weeks.times do |i|
      year.weeks << Week.populate(i+1, start_date + i.weeks)
    end

    year
  end

  def week_for(date)
    weeks.find_by(start_date: date.beginning_of_week)
  end

  def extend(number_of_weeks)
    last_week = weeks.order(:number).last
    start_number = last_week.number + 1
    start_date = last_week.start_date + 1.week

    number_of_weeks.times do |i|
      weeks << Week.populate(start_number + i, start_date + i.weeks)
    end
  end
end
