class DivisionsController < ApplicationController
  def index
    @divisions =  Division.all.as_json(include: { :conference => { only: [:name, :id] }})
    render json: JSON.pretty_generate(@divisions)
  end
end
