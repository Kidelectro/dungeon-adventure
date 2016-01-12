class TreasureChamber < Room

  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "Treasure Chamber"
  end
#description of your dungeon room
  def description
    description = puts "You are in a brightly lit room that doesn't smell as bad as "\
    "most of the dungeon. What really draws your eye here are the number of chests and "\
    "shelves filled with items of all sorts, most of it likely retreived from persons "\
    "such as yourself who died adventuring here."
    if @monster
      puts "A #{@monster.monster} is here standing guard."
    else
      puts "The room is eerily quite."
    end

    if @treasure
      puts "A large chest draws your eye, it looks like it contains something valuable!"
    else
      puts "There is nothing of value left here, as it is mostly junk and knick knacks."
    end
  end
#paths the room has(up, down, north, south etc.)
  def paths
    paths = {}
  end
#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 90
      @monster = MonsterTable::spawn_monster(x) #x is the level of the monster that will spawn
    end
  end
#if the room has a chance to spawn a treasure chest, this method spawns one
  def treasure_chance
    chance = roll.d100(1)
    if chance <= 100
      @treasure = Treasure.new
    end
  end
#special room rules should go here
#This room contains more treasure than normal.
#Players can search this room. Failing a check will summon another monster.
end
