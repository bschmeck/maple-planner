require 'securerandom'

class Share < ApplicationRecord
  belongs_to :year

  before_save :assign_random_code

  def assign_random_code
    self.code ||= SecureRandom.hex.first(8)
  end

  def to_param
    code
  end
end
