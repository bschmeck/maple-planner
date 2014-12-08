class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :year
end
