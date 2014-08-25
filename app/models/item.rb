class Item < ActiveRecord::Base
  belongs_to :day

  scope :for_grade, ->(grade){ where(grade: grade) }
end
