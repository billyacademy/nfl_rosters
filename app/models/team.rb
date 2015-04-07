class Team < ActiveRecord::Base
  belongs_to :division
  has_many :players

  def self.create_teams(team_csv)
    CSV.foreach(team_csv, headers: true) do |row|
      team_name = row[0]
      division = Division.find_by(name: row[1]).id
      Team.find_or_create_by(name: team_name, division_id: division)
    end
  end
end
