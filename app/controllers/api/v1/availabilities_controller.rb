# frozen_string_literal: true
module Api
  module V1
    class AvailabilitiesController<ApplicationController
      before_action :authenticate_user!


      def create
        availability = current_user.availabilities.new(availability_params)
        if availability.save
          render json: availability, status: :created
        else
          render json: availability.errors, status: :unprocessable_entity
        end
      end

      def index
        availabilities = current_user.availabilities
        render json: availabilities, status: :ok
      end

      def destroy
        availability = current_user.availabilities.find(params[:id])
        availability.destroy
        head :no_content
      end


      private
      def availability_params
        params.permit(:date, :start_time, :end_time)
      end
    end
  end
end

