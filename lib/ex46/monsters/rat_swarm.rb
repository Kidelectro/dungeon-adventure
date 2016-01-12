class RatSwarm < Monster

  def initialize(level)
    @strength = 2
    @agility = 3
    @stamina = 2
    @magic = 1
    @spirit = 1
    @type = "Animal"
    @monster = "Rat Swarm"
    @hps = hps(level)
    @level = level
    super
  end

  def speak
    puts "Rattle Rattle"
  end

  def hps(level)
    roll.d2(level) + stamina
  end

end
