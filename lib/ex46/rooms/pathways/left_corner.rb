class LeftCorner < Room

  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "Left Corner"
  end

  def description
    description = "A room that turns to the left."
  end

  def enter
    $movement = "go left"
    puts "This small room turns to the left as light from the exit glances off " \
    "the opposite wall. Dirt and grim cover the floor here, but otherwise it is a non-descript " \
    "portion of the dungeon."
    if @monster
      puts "An evil #{@monster.monster} is here."
    else
      puts "The room is eerily quite."
    end
  end
#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 60
      @monster = MonsterTable::spawn_monster(1) #x is the level of the monster that will spawn
    end
  end
#if the room has a chance to spawn a treasure chest, this method spawns one
#special room rules should go here
end
