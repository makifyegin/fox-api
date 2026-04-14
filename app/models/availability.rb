class Availability < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :date_not_in_past

  private

  def end_time_after_start_time
    # think: what do you need to check?
    # if end_time is before or equal to start_time, add an error
  end

  def date_not_in_past
    # think: what do you need to check?
    # if date is before today, add an error
  end

end
