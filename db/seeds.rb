# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
require 'pry'

# CONFERENCES = ['AFC', 'NFC']
# DIVISIONS = ['North', 'South', 'East', 'West']
#
# Conference.find_or_create_by(name: 'AFC')
# Conference.find_or_create_by(name: 'NFC')
#
#
# DIVISIONS.each do |division|
#   CONFERENCES.each do |conference|
#     Division.find_or_create_by(
#     name: "#{conference} #{division}",
#     conference_id: Conference.find_by(name: conference).id
#     )
#   end
# end
#
#
# teams = 'teams.csv'
  players = 'nfl_2014.csv'
  teams = {
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
#
#
# CSV.foreach(teams, headers: true) do |row|
#   team_name = row[0]
#   division = Division.find_by(name: row[1]).id
#   Team.find_or_create_by(name: team_name, division_id: division)
# end

CSV.foreach(players, headers: true, force_quotes: true) do |row|
  team = Team.find_by(name: teams[row["Team"]])
  Player.find_or_create_by(name: row["Player"], position: row["Position"],  team_id: team.id)
end
