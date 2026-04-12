# frozen_string_literal: true

module Api
  module V1

    class ProfileController < ApplicationController
      before_action :authenticate_user!
      def show
        render json: current_user, only: [:id, :email, :first_name, :last_name, :role, :region_id]
      end

    end

  end
end
