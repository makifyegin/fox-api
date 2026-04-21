# frozen_string_literal: true

  module Api
    module V1
      class PublicAvailabilitiesController < ApplicationController
        def index
          region = Region.find(params[:region_id])
          availabilities = Availability.where(user_id: region.users.ids)

          result = availabilities.map do |a|
            {
              id: a.id,
              date: a.date,
              available_slots: a.available_slots
            }
          end

          render json: result
        end
        end
      end

    end


