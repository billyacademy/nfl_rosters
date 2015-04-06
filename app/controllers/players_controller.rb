class PlayersController < ApplicationController
  def index
    @players = Player.all.as_json
    render json: JSON.pretty_generate(@players)
  end
end
