# frozen_string_literal: true

# GET route for the stations resource
resources :stations, only: %i[index]

# Registers a station via Ping at the database
post "stations/ping", to: "stationsping#ping"
