class TIntersection < Room

  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "Three-way Intersection"
  end

  def description
    description = "A room that splits in two different directions."
  end
#description of your duneon room
  def enter
    description = "This is a narrow hallway with two exits to the left or right."
    if @monster
      puts "An evil #{@monster.monster} is here."
    else
      puts "The room is eerily quite."
    end
  end

#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 70
      @monster = MonsterTable::spawn_monster(1)
    end
  end
#if the room has a chance to spawn a treasure chest, this method spawns one
  def treasure_chance
    chance = roll.d100(1)
    if chance <= 0
      @treasure = Treasure.new
    end
  end
#special room rules should go here
end
