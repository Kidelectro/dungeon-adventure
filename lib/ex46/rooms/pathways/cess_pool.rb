class CessPool < Room
  @search = false #this gets set to true after the player has searched
  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "Cess Pool"
  end

  def description
    description = "A room with an inky, smelly, pool of 'water'."
  end
#description of your dungeon room
  def enter
    $movement = "take path"
    puts "This room opens up into a somewhat large cavernous room that mostly contains "\
    "a dark and foul looking body of... something. It most likely used to be water, but the lack "\
    "of a current and the fact that the denezins of this place have used it as a latrine for "\
    "what seems like centuries has turned the body into a foul smelling disease ridden pool."\
    "A path runs along side of the pool leading to other parts of the dungeon."
    if @monster
      puts "An evil #{@monster.monster} is doing its business here."
    else
      puts "Except for an occasional bubbling from the pool, the room is eerily quite."
    end
  end
#If the room has the chance to spawn a monster, this method spawns one
  def monster_chance
    chance = roll.d100(1)
    if chance <= 10
      @monster = MonsterTable::spawn_monster(1) #x is the level of the monster that will spawn
    end
  end
#special room rules should go here
  def available_actions
    super.merge({ "search" => "You search the grimy pool"

      })
  end
#This room causes the player to make a con check. If they fail they take a few hitpoints in damage
#players can try searching the room and may find something of value, but doing so requires a
#successfull con check.
end
