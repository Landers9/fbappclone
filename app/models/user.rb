class User < ApplicationRecord

  validates :first_name, presence: true, length: {maximum: 30}

  validates :last_name, presence: true, length: {maximum: 30}

  validates :email, presence: true, length: {maximum: 255}, uniqueness: true,
  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  before_validation {email.downcase!}

  has_secure_password

  validates :password, :password_confirmation, presence: true, length: {minimum: 6}

  validates :gender, presence: true

  has_many :posts
end
