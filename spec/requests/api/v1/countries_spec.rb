require "rails_helper"

RSpec.describe "Countries API", type: :request do
  describe "GET /api/v1/countries" do
    before do
      Country.create!(name: "United Kingdom", code: "GB")
      Country.create!(name: "France", code: "FR")
    end

    it "returns all countries" do
      get "/api/v1/countries"

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json.length).to eq(2)
    end
  end
end