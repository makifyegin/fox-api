# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bookings', type: :request do

  let(:region) { create(:region) }
  let(:user) { create(:user, region: region) }
  let(:availability) { create(:availability, user: user) }
  let(:token) {JwtService.encode(user.id)}
  context 'when you want to create a booking' do
    it 'POST /api/v1/bookings' do
      post "/api/v1/bookings",
           params: {availability_id: availability.id,
                    start_time: '10:00',
                    duration: 15,
                    interview_type: "video",
                    booker_type: "applicant",
                    name: "Akif",
                    email: "applicant@servas.dev" }
      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["status"]).to eq("pending")
    end
  end

  context 'when Interviewer wants to see bookings' do
    it 'GET /api/v1/bookings' do
      Booking.create!(availability: availability, booker: create(:booker, region: region), start_time: "10:00", duration: 30, interview_type: "video", status: "pending")
      get "/api/v1/bookings",
          headers: {"Authorization"=> "Bearer #{token}"}
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end
  end
end
