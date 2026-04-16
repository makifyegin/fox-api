class Booker < ApplicationRecord
  has_many :bookings
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :booker_type, inclusion: { in: %w(applicant member) }

end
