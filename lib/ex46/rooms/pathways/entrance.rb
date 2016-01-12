class Entrance < Room

  def initialize
    monster_chance
  end

  def name
    name = "Dungeon Entrance"
  end

  def description
    description = "This is the entrance to the dungeon."
  end

  def enter
    puts "This is the entrance to the dungeon. It is dark, dirty, and smells of death. " \
    "From here there is a doorway, which takes you deeper into the dungeon."
    if @monster
      puts "An evil #{@monster.monster} is here."
    else
      puts "The room is eerily quite."
    end
    player_choice
  end

  def paths
    paths = "#{CreateDungeon::dungeon_deck[2].name}"
  end

  def monster_chance
    chance = roll.d100(1)
    if chance <= 40
      @monster = MonsterTable::spawn_monster(1)
    end
  end

  def treasure_chance
    chance = roll.d100(1)
    if chance <= 10
      @treasure = Treasure.new
    end
  end

end
