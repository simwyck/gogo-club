class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.last_name = last_name.upcase }
  #validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
