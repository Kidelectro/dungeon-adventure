class Monster
  attr_accessor :hps, :attack, :type, :monster, :strength, :agility,
                :stamina, :magic, :spirit, :level, :accuracy, :defense,
                :evasion, :mdefense, :mattack

  def initialize(level)
    @attack = basic_atk_value(level)
  end

  def roll
    roll = Dice.new
  end

  def basic_atk_value(level)
    strength + level
  end

  def has_attributes
    puts "#{@name} the #{@monster} has:"
    puts "Str: #{@strength}"
    puts "Sta: #{@stamina}"
    puts "Agi: #{@agility}"
    puts "Mag: #{@magic}"
    puts "Spi: #{@spirit}"
    puts "Hps: #{@hps}, Atk: #{@attack}"
  end

end
