class TwoRoomCorridor < Room

  def initialize
    monster_chance
    #this room will create two dead end rooms, one to the left and to the right.
  end
#the name of your dungeon room
  def name
    name = "Two Room Corridor"
  end
#description of your dungeon room
  def description
    description = puts "This looks like a standard dungeon hallway leading off into the " \
    "darkness of beyond, however there is a dim light coming from doorways to the left " \
    "and right."
    if @monster
      puts "An evil #{@monster.monster} is here."
    else
      puts "The room is eerily quite."
    end
  end
#paths the room has(up, down, north, south etc.)
  def paths
    paths = {}
  end
#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 70
      @monster = MonsterTable::spawn_monster(1) #x is the level of the monster that will spawn
    end
  end
#if the room has a chance to spawn a treasure chest, this method spawns one
  def treasure_chance
    chance = roll.d100(1)
    if chance <= 10
      @treasure = Treasure.new
    end
  end

end
