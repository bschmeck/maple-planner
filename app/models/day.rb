class Day < ActiveRecord::Base
  belongs_to :week

  has_many :items, dependent: :destroy

  def items_for_grade(grade)
    items.for_grade(grade)
  end

  def today?
    date == Date.today
  end
end
