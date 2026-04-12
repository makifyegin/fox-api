# frozen_string_literal: true
module Api
  module V1
    class AuthController < ApplicationController
      def login(email: params[:email])
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          token = JwtService.encode(user.id)
          render json: {token: token}
        else
          render json: {error: "invalid credentials"}, status: :unauthorized

        end
      end
    end

  end
end
