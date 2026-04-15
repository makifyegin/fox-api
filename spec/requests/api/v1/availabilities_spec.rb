# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Availabilities', type: :request do

  let(:country) { Country.create!(name: "United Kingdom", code: "GB")}
  let(:region) {Region.create!(name: "New York", country: country)}
  let(:user) { User.create!(first_name: "Test", last_name: "User", role: "interviewer", email: "test@servas.dev", password: "password123", region: region) }
  let(:user2) { User.create!(first_name: "Test2", last_name: "User", role: "interviewer", email: "test2@servas.dev", password: "password123", region: region) }
  let(:token) {JwtService.encode(user.id)}
  context 'POST api/v1/availabilities' do
    it 'creates an availability with valid params' do
      post '/api/v1/availabilities', params: {date: Date.tomorrow, start_time: "10:00", end_time: "14:00"},
      headers: {"Authorization" => "Bearer #{token}"}

      expect(response).to have_http_status(:created)
    end
  end
  context 'GET api/v1/availabilities' do

    it 'returns my availabilities' do
      Availability.create!(user: user, date: Date.tomorrow, start_time: "10:00", end_time: "14:00")

      get '/api/v1/availabilities',
           headers: {"Authorization" => "Bearer #{token}"}

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end

    it 'does not returns others availabilities' do
      Availability.create!(user: user, date: Date.tomorrow, start_time: "10:00", end_time: "14:00")
      Availability.create!(user: user2, date: Date.tomorrow, start_time: "13:00", end_time: "14:00")

      get '/api/v1/availabilities',
          headers: {"Authorization" => "Bearer #{token}"}

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end

    context 'DELETE /api/v1/availabilities/:id' do
      it 'deletes an availability' do
        availability = Availability.create!(user: user, date: Date.tomorrow, start_time: "10:00", end_time: "14:00")

        delete "/api/v1/availabilities/#{availability.id}",
               headers: {"Authorization" => "Bearer #{token}"}

        expect(response).to have_http_status(:no_content)
      end

    end
  end
end
