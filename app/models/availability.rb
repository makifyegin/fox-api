class Availability < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :date_not_in_past

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
