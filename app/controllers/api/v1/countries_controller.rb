module Api
  module V1
    class CountriesController< ApplicationController
      def index
        countries = Country.all
        render json: countries
      end
    end
  end
end