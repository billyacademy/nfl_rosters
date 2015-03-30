class DivisionsController < ApplicationController
  def index
    render json: Division.all
  end
end
