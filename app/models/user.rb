class User < ActiveRecord::Base
  validates :name,              :presence => true, :uniqueness => true
  validates :provider,          :presence => true
  validates :uid,               :presence => true
  validates :profile_image_url, :presence => true

  def to_param
    name
  end
end
