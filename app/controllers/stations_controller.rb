# frozen_string_literal: true

class StationsController < ApplicationController
  #before_action :set_repository, only: %i[show toggle_star]


  # GET /stations
  # GET /stations.json

  def index
    @stations = Station.all
    @stations_serialized = API::Entities::Stations.represent(
      @stations,
      type:         :internal
    ).to_json
  end
end
