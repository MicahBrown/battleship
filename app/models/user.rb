class User < ApplicationRecord
  has_secure_token :uuid
  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
