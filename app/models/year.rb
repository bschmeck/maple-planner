class Year < ActiveRecord::Base
  has_many :weeks, dependent: :destroy
end
