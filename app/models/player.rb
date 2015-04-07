class Player < ActiveRecord::Base
  belongs_to :team

  def self.create_players(player_csv)
    team_abbrv_hash = {
      "MIA" => "Miami Dolphins",
      "NYJ" => "New York Jets",
      "BUF" => "Buffalo Bills",
      "NWE" => "New England Patriots",
      "GNB" => "Green Bay Packers",
      "CHI" => "Chicago Bears",
      "MIN" => "Minnesota Vikings",
      "DET" => "Detroit Lions",
      "K.C" => "Kansas City Chiefs",
      "SDG" => "San Diego Chargers",
      "DEN" => "Denver Broncos",
      "OAK" => "Oakland Raiders",
      "PHI" => "Philadelphia Eagles",
      "NYG" => "New York Giants",
      "DAL" => "Dallas Cowboys",
      "WAS" => "Washington Redskins",
      "IND" => "Indianapolis Colts",
      "BAL" => "Baltimore Ravens",
      "CLE" => "Cleveland Browns",
      "PIT" => "Pittsburgh Steelers",
      "CIN" => "Cincinnati Bengals",
      "JAC" => "Jacksonville Jaguars",
      "TEN" => "Tennessee Titans",
      "HOU" => "Houston Texans",
      "ARI" => "Arizona Cardinals",
      "STL" => "St. Louis Rams",
      "SEA" => "Seattle Seahawks",
      "SFO" => "San Francisco 49ers",
      "TAM" => "Tampa Bay Buccaneers",
      "ATL" => "Atlanta Falcons",
      "CAR" => "Carolina Panthers",
      "NOR" => "New Orleans Saints"
    }

    CSV.foreach(player_csv, headers: true, force_quotes: true) do |row|
      team = Team.find_by(name: team_abbrv_hash[row["Team"]])
      Player.find_or_create_by(name: row["Player"], position: row["Position"],  team_id: team.id)
    end
  end
end
