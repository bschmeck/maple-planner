class Row < ActiveRecord::Base
  belongs_to :year
  has_one :user, through: :year

  has_many :items
end
