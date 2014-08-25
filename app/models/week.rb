class Week < ActiveRecord::Base
  belongs_to :year

  has_many :days
end
