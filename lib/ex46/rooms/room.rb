class Room
  require "./lib/ex46/game_engines/monster_table.rb"
  attr_reader :name, :paths, :description

  def initialize
    @name = name
    @description = description
    @paths = {}
  end

  def available_actions
    @@actions
  end

  def roll
    roll = Dice.new
  end

end
