class Day < ApplicationRecord
  belongs_to :week
  has_one :year, through: :week

  has_many :items, dependent: :destroy

  def items_for_row(row)
    items.for_row(row)
  end

  def today?
    date == Date.today
  end
end
