class RoomNameHere < Room

  def initialize
    monster_chance
  end
#the name of your dungeon room
  def name
    name = "King's Throne Room"
  end
#description of your dungeon room
  def description
    description = puts "This is the king's throne room." \
  end
#paths the room has(up, down, north, south etc.)
  def enter
    puts "For beating the dragon, the king knights you and gives you lands."
  end
#If the room has the chance to spawn a monster, this method spawns one

#if the room has a chance to spawn a treasure chest, this method spawns one

#special room rules should go here
end
