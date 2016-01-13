class DownFloor < Room

  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "Down Floor"
  end
#description of your dungeon room
  def description
    description = "A room that contains a way down."
  end

  def enter
    puts "You have managed to reach the end of the current floor. The only " \
    "way to go is either back the way you came or downward, deeper into enemy territory."
    if @monster
      puts "An evil #{@monster.monster} is here."
    else
      puts "The room is eerily quite."
    end
  end
#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 80
      @monster = MonsterTable::spawn_monster(1) #x is the level of the monster that will spawn
    end
  end
#if the room has a chance to spawn a treasure chest, this method spawns one
  def treasure_chance
    chance = roll.d100(1)
    if chance <= 70
      @treasure = Treasure.new
    end
  end
#special room rules should go here
end
