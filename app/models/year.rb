class Year < ActiveRecord::Base
  has_many :weeks, dependent: :destroy

  def self.populate(name, number_of_weeks, start_date)
    year = create(name: name)
    0.upto(number_of_weeks) do |i|
      year.weeks << Week.populate(i+1, start_date + i.weeks)
    end

    year
  end
end
