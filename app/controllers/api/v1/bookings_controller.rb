# frozen_string_literal: true

module Api
  module V1
    class BookingsController < ApplicationController
      before_action :authenticate_user!, only: [:index]

      def create
        booker = Booker.find_or_create_by!(email: params[:email]) do |b|
          b.name = params[:name]
          b.region = Availability.find(params[:availability_id]).user.region
          b.booker_type = params[:booker_type]
        end
        booking = Booking.new(
          booker: booker,
          availability_id: params[:availability_id],
          start_time: params[:start_time],
          duration: params[:duration],
          interview_type: params[:interview_type],
          status: "pending"
        )

        if booking.save
          render json: booking, status: :created
        else
          render json: booking.errors, status: :unprocessable_entity
        end

      end
      def index
        bookings = Booking.where(availability_id: current_user.availabilities.ids)
        render json: bookings, status: :ok
      end
    end
  end
end

