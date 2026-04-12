# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auth', type: :request do

  let(:united_kingdom)  {Country.create!(name: "United Kingdom", code: "GB")}
  let(:london) {Region.create!(name:"London",country: united_kingdom)}
  let(:user)  {User.create!(email: "user@servas.dev", password: "password123", first_name: "User", last_name: "Dev", role: "admin", region: london)}

  context 'POST /api/v1/login' do
    it 'returns a token with a valid credentials' do
      user
      post "/api/v1/login", params: {email: "user@servas.dev", password: "password123"}
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["token"]).not_to be_nil
    end

    it 'rejects invalid credentials' do
      user
      post  "/api/v1/login", params: {email: user.email, password: "password1235"}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
