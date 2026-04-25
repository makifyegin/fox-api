# frozen_string_literal: true

class RegionsController < WebController

  def show
    @region = Region.find(params[:id])
    @interviewers = @region.users
  end
end
