class Conference < ActiveRecord::Base
  has_many :divisions
  has_many :teams, through: :divisions
end
