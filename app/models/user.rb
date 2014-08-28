class User < ActiveRecord::Base
  devise :rememberable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :years
  has_many :weeks, through: :years

  def self.find_or_create_by_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    User.find_or_create_by(email: data["email"])
  end
end
