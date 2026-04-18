# frozen_string_literal: true

  module Api
    module V1
      class PublicAvailabilitiesController < ApplicationController
        def index
          region = Region.find(params[:region_id])
          availabilities = Availability.where(user_id: region.users.ids)
          render json: availabilities

          end
        end
      end

    end


