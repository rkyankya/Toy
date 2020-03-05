# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  attr_accessor :remember_token
  ############
  # Paste this two functions after your validations and before private (If you have it)
  def remember(token)
    self.remember_token = token
    update_attribute(:remember_digest, BCrypt::Password.create(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  ############
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  extend FriendlyId
  friendly_id :username, use: :slugged

  # include Gravtastic
  # gravtastic
end
