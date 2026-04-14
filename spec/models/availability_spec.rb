# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Availability, type: :model do

  let(:country) { Country.create!(name: "United Kingdom", code: "GB") }
  let(:region) { Region.create!(name: "London", country: country) }
  let(:user) { User.create!(email: "test@servas.dev", password: "password123", first_name: "John", last_name: "Smith", role: "interviewer", region: region) }
  let(:availability) { Availability.new(user: user, date: Date.tomorrow, start_time: "10:00", end_time: "14:00") }


    it 'is not Valid without date' do
      availability.date = nil
      expect(availability).not_to be_valid
    end

    it 'is not Valid without start time' do
      availability.start_time = nil
      expect(availability).not_to be_valid
    end

    it 'is not Valid without end time' do
      availability.end_time = nil
      expect(availability).not_to be_valid
    end

    it 'is not valid when end_time is before start_time' do
      availability.end_time = "09:00"
      expect(availability).not_to be_valid
    end

    it 'is not valid when date is in the past' do
      availability.date = Date.yesterday
      expect(availability).not_to be_valid
    end
end
