module Api
  module V1
    class RegionsController < ::ApplicationController
      def index
        regions = Country.find_by!(code: params[:country_code]).regions
        render json: regions
      end
    end
  end
end