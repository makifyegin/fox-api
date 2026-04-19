# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bookings', type: :request do


  context 'when condition' do
    let(:region) { create(:region) }
    let(:user) { create(:user, region: region) }
    let(:availability) { create(:availability, user: user) }

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

    it 'GET /api/v1/bookings' do
      get "/api/v1/bookings"
    end
  end
end
