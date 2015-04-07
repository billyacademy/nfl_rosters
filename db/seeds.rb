# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
require 'pry'

CONFERENCES = ['AFC', 'NFC']
REGIONS = ['North', 'South', 'East', 'West']
players_csv = 'nfl_2014.csv'
teams_csv = 'teams.csv'

Conference.create_conferences(CONFERENCES)
Division.create_divisions(REGIONS, CONFERENCES)
Team.create_teams(teams_csv)
Player.create_players(players_csv)
