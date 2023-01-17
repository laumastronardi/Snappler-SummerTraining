# https://ruby-doc.org/core-3.1.1/File.html
# Read JSON file

# https://ruby-doc.org/stdlib-3.1.1/libdoc/json/rdoc/JSON.html
# Parse JSON content to Hash

# https://github.com/ruby/debug
# debugger

# frozen_string_literal: true
require 'test'
require 'sinatra'

db = Main.new('./gem/lib/swapi.json')

get '/people/:id' do
  people = Person.new(db)
  puts people.find_by_name(params[:id])
end

get '/vehicles/:id' do
  vehicles = Vehicles.new(db)
  puts vehicles.find_by_name(params[:id])
end

get '/starships/:id' do
  starships = Starships.new(db)
  puts starships.find_by_name(params[:id])
end