class Division < ActiveRecord::Base
  belongs_to :conference
  has_many :teams

  def self.create_divisions(regions, conferences)
    regions.each do |region|
       conferences.each do |conference|
         Division.find_or_create_by(
         name: "#{conference} #{region}",
         conference_id: Conference.find_by(name: conference).id
         )
      end
    end
  end
end
