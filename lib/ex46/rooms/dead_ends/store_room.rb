class StoreRoom < Room

  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "Store Room"
  end
#description of your dungeon room
  def description
    description = puts "Shelves containing food and other common supplies line the walls "\
    "here. These things were probably stolen from the local village or nearby farms during "\
    "raids. Although there doesn't seem to be anything of value here, you never know what a "\
    "search will turn up."
    puts "You can go back the way you came from."
    if @monster
      puts "An evil #{@monster.monster} is here, ruffling for something to eat."
    else
      puts "The squeek of a rat and pitter-patter of tiny rodent feet is all you hear."
    end
  end
#paths the room has(up, down, north, south etc.)
  def paths
    paths = {}
  end
#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 50
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
#players can search here and will find food. Eating the food has a chance to heal or injure
#the player.
end
