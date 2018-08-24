# frozen_string_literal: true

class StationspingController < ActionController::Base

  skip_before_action :verify_authenticity_token

  def ping

    id = params[:id]
    station = Station.find_by station_id: id

    if station.nil?
      Station.create station_id: id, active: true
    else
      station.update active: true, display_name: params[:display_name]
    end

    render json: {
      status: 200,
      message: "Successfully created Station"
    }.to_json
  end
end
