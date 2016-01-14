class Player
  attr_accessor :hps, :attack, :type, :monster, :strength, :agility,
                :stamina, :magic, :spirit, :level, :accuracy, :defense,
                :evasion, :mdefense, :mattack, :name

#primary stats Strength, Agility, Stamina, Magic, spirit

#secondary stats: hp's, mp's, atk, m_atk, accuracy, evation, defense, m_defense
  def initialize

  end

  def roll
    roll = Dice.new
  end

  def basic_atk_value
    strength + level
  end

  def hps(level)
    roll.d4(level) + stamina
  end
  #walks the player through creating a character, and then sets attributes.

  #character has a backpack(array or hash) that can store things.
  #
end
