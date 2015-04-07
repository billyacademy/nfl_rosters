class Conference < ActiveRecord::Base
  has_many :divisions
  has_many :teams, through: :divisions

  def self.create_conferences(conferences)
    conferences.each do |conference|
      Conference.find_or_create_by(name: conference)
    end
  end
end
