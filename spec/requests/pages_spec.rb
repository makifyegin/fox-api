# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do

  context 'when you get home page' do
    it 'succeeds' do
      get "/"
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('text/html')
      expect(response.body).to include("Servas International")
    end
  end
end
