# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/v1/countries/:country_code/regions', type: :request do
  let(:united_kingdom)  {Country.create!(name: "United Kingdom", code: "GB")}
  let(:london) {Region.create!(name:"London",country: united_kingdom)}

  context 'when condition' do
    it 'returns regions for a country' do
      london # this triggers the let to actually create the data
      get "/api/v1/countries/#{united_kingdom.code}/regions"
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json.length).to eq(1)

    end
  end
end
