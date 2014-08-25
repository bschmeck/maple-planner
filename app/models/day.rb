class Day < ActiveRecord::Base
  belongs_to :week

  has_many :items
end
