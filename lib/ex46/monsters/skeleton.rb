class Skeleton < Monster

  def initialize(level)
    @strength = 3
    @agility = 1
    @stamina = 5
    @magic = 1
    @spirit = 5
    @type = "Undead"
    @monster = "Skeleton"
    @hps = hps(level)
    @level = level
    super
  end

  def speak
    puts "Rattle Rattle"
  end

  def hps(level)
    roll.d4(level) + stamina
  end

end
