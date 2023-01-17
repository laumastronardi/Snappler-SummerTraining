require 'json'
require 'debug'

module Finder
  def find_by_key_value(key, value)
    @data.select { |p| p[key] == value }
  end

  def find_by_name(value)
    @data.select { |p| p['name'] == value }
  end
end

class Main
  attr_accessor :db

  include Finder

  def initialize(json_file)
    @db = JSON.parse(File.read(json_file))
  end

  def people
    @db['people']
  end

  def vehicles
    @db['vehicles']
  end

  def starships
    @db['starships']
  end
end

class Person < Main
  attr_accessor :data

  def initialize(db)
    @data = db.people
  end
end

class Vehicles < Main
  attr_accessor :data

  def initialize(db)
    @data = db.vehicles
  end
end

class Starships < Main
  attr_accessor :data

  def initialize(db)
    @data = db.starships
  end
end
