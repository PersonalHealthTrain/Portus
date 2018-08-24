# frozen_string_literal: true

class StationsController < ApplicationController
  #before_action :set_repository, only: %i[show toggle_star]


  # GET /stations
  # GET /stations.json

  def index
    @repositories = policy_scope(Repository)
    @team_repositories = Repository
                           .joins(namespace: { team: :users })
                           .where("users.id = :user_id", user_id: current_user.id)
    @other_repositories = @repositories - @team_repositories
    @team_repositories_serialized = API::Entities::Repositories.represent(
      @team_repositories,
      current_user: current_user,
      type:         :internal
    ).to_json
    @other_repositories_serialized = API::Entities::Repositories.represent(
      @other_repositories,
      current_user: current_user,
      type:         :internal
    ).to_json
  end
end
