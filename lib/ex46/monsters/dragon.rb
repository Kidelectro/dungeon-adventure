class Dragon < Monster
    attr_accessor :name
  NAMES = ["Ygraassl", "Grrrghhhta", "Laarrsst", "Kraaaggin", "Skaaarssg", "Bob"]

  def initialize(level)
    @strength = 10
    @agility = 5
    @stamina = 10
    @magic = 5
    @spirit = 7
    @type = "Dragon"
    @monster = "Dragon"
    @name = name_randomizer
    @hps = hps(level)
    @level = level
    super
  end

  def speak
    puts "Gimme your princess!"
  end

  def name_randomizer
    name = NAMES.sample
  end

  def hps(level)
    roll.d10(level) + stamina
  end

end
