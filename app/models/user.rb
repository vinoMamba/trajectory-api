class User < ApplicationRecord
  validates :full_name, presence: true,
            uniqueness: true
  validates :password_digest, presence: true
  has_secure_password
end
