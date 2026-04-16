require 'rails_helper'
RSpec.describe Booking, type: :model do
  let(:booking) { build(:booking) }

  it "is valid with all fields" do
    expect(booking).to be_valid
  end

  it "is not valid without an availability" do
    booking.availability = nil
    expect(booking).not_to be_valid
  end

  it "is not valid without a booker" do
    booking.booker = nil
    expect(booking).not_to be_valid
  end

  it "is not valid without a start_time" do
    booking.start_time = nil
    expect(booking).not_to be_valid
  end

  it "is not valid without a duration" do
    booking.duration = nil
    expect(booking).not_to be_valid
  end

  it "is not valid with duration other than 15 or 30" do
    booking.duration = 45
    expect(booking).not_to be_valid
  end

  it "is not valid without an interview_type" do
    booking.interview_type = nil
    expect(booking).not_to be_valid
  end

  it "is not valid with invalid interview_type" do
    booking.interview_type = "phone"
    expect(booking).not_to be_valid
  end

  it "is not valid without a status" do
    booking.status = nil
    expect(booking).not_to be_valid
  end

  it "is not valid with invalid status" do
    booking.status = "maybe"
    expect(booking).not_to be_valid
  end
end