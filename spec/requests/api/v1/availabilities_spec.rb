# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Availabilities', type: :request do

  let(:country) { Country.create!(name: "United Kingdom", code: "GB")}
  let(:region) {Region.create!(name: "New York", country: country)}
  let(:user) { User.create!(first_name: "Test", last_name: "User", role: "interviewer", email: "test@servas.dev", password: "password123", region: region) }
  let(:token) {JwtService.encode(user.id)}
  context 'POST api/v1/availabilities' do
    it 'creates an availability with valid params' do
      post '/api/v1/availabilities', params: {date: Date.tomorrow, start_time: "10:00", end_time: "14:00"},
      headers: {"Authorization" => "Bearer #{token}"}

      expect(response).to have_http_status(:created)
    end
  end
end
