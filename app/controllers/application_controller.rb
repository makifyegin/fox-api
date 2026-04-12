class ApplicationController < ActionController::API
  def authenticate_user!
    header = request.headers["Authorization"]
    if header

      token = header.split(" ").last
      decoded = JwtService.decode(token)

      @current_user = User.find(decoded["user_id"])
    else

      render json: {error: "unauthorized"}, status: :unauthorized
    end
  rescue
    # if anything goes wrong (bad token, user not found)
    # render unauthorized error
    render json: {error: "unauthorized"}, status: :unauthorized

  end

  def current_user
    @current_user
  end



end
