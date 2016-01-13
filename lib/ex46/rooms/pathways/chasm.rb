class Chasm < Room

  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "Chasm"
  end
#description of your dungeon room
  def description
    description = "A room with a deep chasm."
  end

  def enter
    puts "A rickety bridge spans a dark seemingly bottomless chasm here. " \
    "You can barely make out torches framing the exit of the bridge " \
    "on the other side, leading further into the dungeon." \
    "Don't look down!"
    if @monster
      puts "An evil #{@monster.monster} is here."
    else
      puts "The air whispers with low howls and secrets but is otherwise quite."
    end
  end
#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 20
      @monster = MonsterTable::spawn_monster(1) #x is the level of the monster that will spawn
    end
  end

#special room rules should go here
#a character will have to cross the bridge here. Perhaps leading to death if they fail a check?
end
