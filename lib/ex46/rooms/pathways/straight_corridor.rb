class StraightCorridor < Room

  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "Corridor"
  end

  def description
    description = "A long straight corridor"
  end
#description of your duneon room
  def enter
    puts "A long dark and dank hallway. Dimly lit torches line the walls." \
    "You can go back or you can continue forward."
    if @monster
      puts "An evil #{@monster.monster} is here blocking your path."
    else
      puts "The room is eerily quite."
    end
  end

#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 90
      @monster = MonsterTable::spawn_monster(1)
    end
  end
#if the room has a chance to spawn a treasure chest, this method spawns one
  def treasure_chance
    chance = roll.d100(1)
    if chance <= 10
      @treasure = Treasure.new
    end
  end
#special room rules should go here
end
