require 'rails_helper'

RSpec.describe 'Profile', type: :request do
  let(:country) { Country.create!(name: "United Kingdom", code: "GB") }
  let(:region) { Region.create!(name: "London", country: country) }
  let(:user) { User.create!(email: "test@servas.dev", password: "password123", first_name: "John", last_name: "Smith", role: "interviewer", region: region) }

  context 'GET /api/v1/profile' do
    it 'returns user info with valid token' do
      token = JwtService.encode(user.id)
      get "/api/v1/profile", headers: { "Authorization" => "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["email"]).to eq("test@servas.dev")
    end

    it 'rejects request without token' do
      get "/api/v1/profile"
      expect(response).to have_http_status(:unauthorized)
    end
  end
end