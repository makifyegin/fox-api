# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PublicAvailabilities', type: :request do
  let(:region) { create(:region) }
  let(:user) { create(:user, region: region) }
  let(:availability) { create(:availability, user: user) }

  context 'when condition' do
    it 'GET /api/v1/regions/:region_id/availabilities' do
      availability
      get "/api/v1/regions/#{region.id}/availabilities"
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end
  end
end
