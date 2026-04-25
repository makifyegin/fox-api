# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regions', type: :request do


  context 'when user want to see interview team by region' do
    let(:country) { create :country }
    let(:region) { create :region, country: country }
    it 'succeeds' do
      get "/regions/#{region.id}"
      expect(response.status).to eq 200
      expect(response.content_type).to include('text/html')
      expect(response.body).to include(region.name)
    end
  end
end
