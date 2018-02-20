class User < ActiveRecord::Base
  has_secure_password
  has_many :projects

  validates_presence_of :username
  validates_presence_of :email

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find { |user| user.slug == slug}
  end

end
