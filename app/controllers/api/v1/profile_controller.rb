# frozen_string_literal: true

module Api
  module V1

    class ProfileController < ApplicationController
      before_action :authenticate_user!
      def show
        render json: current_user
      end

    end

  end
end
