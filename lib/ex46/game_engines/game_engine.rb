class GameEngine
  @@actions = { "dance" => "You do a little dance.",
                "fart" => "You let out a big fart!",
                "look" => "You take a quick look around and find nothing."}
  def initialize(map)
    @map = map
  end

  def play
    current_room = @map.opening_room
    last_room = @map.dungeon_end
    while current_room != last_room
      next_room_position = @map.my_position
      current_room = @map.next_room(next_room_position)
    end
    current_room.enter
  end

  def player_choice
    print "> "
    action = gets.chomp
    if @@actions.has_key?(action)
    #if choice == @actions.key(@actions["#{choice}"])
      puts @@actions[action]
    else choice
      puts "I don't know what you mean!"
    end
  end

end
