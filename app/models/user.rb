class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true,length: {maximum: 50}
  email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:true,uniqueness: true, format:{with: email_regex}
  validates :password,presence: true,length: { minimum: 6}
  def User.new_token
    securRandom.urlsafe_bade64
    attr_accessor :remember_token
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest,User.digest(remember_token))
    
  end

  
end
