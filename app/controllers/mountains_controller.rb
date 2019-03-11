class MountainsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @mountains = Mountain.where.not(latitude: nil, longitude: nil)

    @markers = @mountains.map do |mountain|
      {
        lng: mountain.longitude,
        lat: mountain.latitude
      }
    end
  end
end
