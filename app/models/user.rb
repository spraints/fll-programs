class User < ApplicationRecord
  has_secure_password
  has_many :projects, foreign_key: "owner_id"

  validates :login,
    presence: true,
    format: /\A[a-z0-9_-]+\z/

  def to_param
    login
  end

  def to_s
    login
  end
end
