class Booking < ApplicationRecord
  belongs_to :availability
  belongs_to :booker
  validates :start_time, presence: true
  validates :duration, presence: true, inclusion: { in: [15, 30] }
  validates :interview_type, presence: true, inclusion: { in: %w(video in_person) }
  validates :status, presence: true, inclusion: { in: %w(pending confirmed cancelled completed rescheduled) }
end