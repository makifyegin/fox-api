# frozen_string_literal: true

class JwtService
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def self.encode(user_id)
    JWT.encode({user_id: user_id}, SECRET_KEY, 'HS256')
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true,  algorithm: 'HS256'  )
    decoded.first
  end
end
