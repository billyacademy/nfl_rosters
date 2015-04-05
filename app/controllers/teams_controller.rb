class TeamsController < ApplicationController
  def index
    @teams = Team.all.as_json(include: { :division => { only: [:id, :name]}}, except: [:created_at, :updated_at, :division_id])
    render json: JSON.pretty_generate(@teams)
  end

  def show
    @team = Team.find(params[:id])

    render json: @team
  end
end
