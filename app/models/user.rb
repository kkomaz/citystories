class User < ActiveRecord::Base
  belongs_to :city
  has_many :posts
  has_many :comments
  acts_as_voter

  def self.from_omniauth(auth)yea
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.nickname = auth.info.nickname
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
    end
  end

  def self.set_user(auth)
    User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.from_omniauth(auth)
  end

end