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
DIVISIONS = ['North', 'South', 'East', 'West']

Conference.find_or_create_by(name: 'AFC')
Conference.find_or_create_by(name: 'NFC')


DIVISIONS.each do |division|
  CONFERENCES.each do |conference|
    Division.find_or_create_by(
    name: "#{conference} #{division}",
    conference_id: Conference.find_by(name: conference).id
    )
  end
end


teams = 'teams.csv'


CSV.foreach(teams, headers: true) do |row|
  team_name = row[0]
  division = Division.find_by(name: row[1]).id
  Team.find_or_create_by(name: team_name, division_id: division)
end
