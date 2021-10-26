class User < ApplicationRecord
  devise :rememberable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :years
  has_many :weeks, through: :years
  has_many :collaborations
  has_many :collaborating_years, through: :collaborations, class_name: "Year", foreign_key: :year_id, source: :year

  def self.find_or_create_by_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    User.find_or_create_by(email: data["email"])
  end
end
