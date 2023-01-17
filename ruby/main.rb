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
people = Person.new(db)
vehicles = Vehicles.new(db)
starships = Starships.new(db)

puts people.find_by_name('C3PO')

get '/people/:id' do
  puts people.find_by_name(params[:id])
end

get '/vehicles/:id' do
  puts vehicles.find_by_name(params[:id])
end

get '/starships/:id' do
  puts starships.find_by_name(params[:id])
end