class BoneRoom < Room

  def initialize
    monster_chance
    #this room has four dead end rooms
  end
#the name of your dungeon room
  def name
    name = "Bone Room"
  end
#description of your dungeon room
  def description
    description = "A room covered in bones."
  end

  def enter
    $movement = "take pathway"
    puts "You're feet produce a small crunch as you enter this long rectangular room. Looking " \
    "about you notice the floor is littered with the bones of countless animals, humans, and " \
    "sub-humans. Well worn paths mark where traffic has ground the bones to dust, producing " \
    "the feeling of soft sand as you take each step. Skulls of every sort line the walls on " \
    "shelves or in recess's within the walls. Despite the grim features, the room is brighly lit " \
    "as it appears to be a commonly used room. A pathway leads deeper into the dungeon, while " \
    "there are four other rooms here, one each on the far left and right sides of the room."
    if @monster
      puts "An evil #{@monster.monster} stands guard here."
    else
      puts "You hear the chattering of rats as they search for bones to pick clean, but otherwise the room is empty."
    end
  end

#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 100
      @monster = MonsterTable::spawn_monster(1) #x is the level of the monster that will spawn
    end
  end
#if the room has a chance to spawn a treasure chest, this method spawns one
  def treasure_chance
    chance = roll.d100(1)
    if chance <= 50
      @treasure = Treasure.new
    end
  end
#special room rules should go here
end
