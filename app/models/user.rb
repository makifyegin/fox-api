class User < ApplicationRecord
  has_secure_password
  belongs_to :region
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :role, inclusion: { in: %w(interviewer admin) }
end
