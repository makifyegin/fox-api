class Booker < ApplicationRecord
  belongs_to :region, optional: true
  has_many :bookings
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :booker_type, presence: true, inclusion: { in: %w(applicant member) }
  validates :region, presence: true, if: -> { booker_type == "applicant" }
end