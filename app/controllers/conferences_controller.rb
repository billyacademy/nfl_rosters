class ConferencesController < ApplicationController
  def index
    render json: Conference.all
  end
end
