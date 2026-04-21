class Availability < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :date_not_in_past


  def available_slots
    slots = []
    current = start_time
    while current < end_time
      slots << current.strftime("%H:%M")
      current += 15.minutes
    end

    # Remove booked slots
    bookings.each do |booking|
      booked_time = booking.start_time
      (booking.duration / 15).times do
        slots.delete(booked_time.strftime("%H:%M"))
        booked_time += 15.minutes
      end
    end

    slots
  end


  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?
    errors.add(:end_time, "must be after start time") if end_time <= start_time
  end

  def date_not_in_past
    return if date.blank?
    errors.add(:date, "...") if date < Date.today
    # think: what do you need to check?
    # if date is before today, add an error
  end




end
