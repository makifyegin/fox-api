class Booking < ApplicationRecord
  before_create :generate_verification_token
  belongs_to :availability
  belongs_to :booker
  validates :start_time, presence: true
  validates :duration, presence: true, inclusion: { in: [15, 30] }
  validates :interview_type, presence: true, inclusion: { in: %w(video in_person) }
  validates :status, presence: true, inclusion: { in: %w(pending confirmed cancelled completed rescheduled) }
  validate :no_double_booking
  #
  #
  private
  def no_double_booking
    return if availability_id.blank? || start_time.blank?
    existing = Booking.where(availability_id: availability_id, start_time: start_time)
    existing = existing.where.not(id: id) if id.present?
    if existing.exists?
      errors.add(:start_time, "is already booked")
    end
  end

  def generate_verification_token
    self.verification_token = SecureRandom.hex(20)
  end



end