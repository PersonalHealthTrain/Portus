# frozen_string_literal: true


resources :stations, only: %i[index]

post "stations/ping", to: "stations/stations#ping"


# Used as a reference for writing this f

# resources :repositories, only: %i[index show destroy] do
#   post :toggle_star, on: :member
#   resources :comments, only: %i[create destroy]
# end
#
# resources :tags, only: %i[show destroy]
