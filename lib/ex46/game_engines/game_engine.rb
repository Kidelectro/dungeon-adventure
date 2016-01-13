class GameEngine
  @@actions = { "dance" => "You do a little dance.",
                "fart" => "You let out a big fart!",
                "directions" => "You type words and it does stuff."}
  def initialize(map)
    @map = map
  end

  def play
    @current_room = @map.opening_room
    puts "\e[H\e[2J"
    while @action != "quit"
      sleep 3
      puts "\e[H\e[2J"
      @current_room.enter
      player_choice
    end
    @current_room.enter
  end

  def player_choice
    print "> "
    @action = gets.chomp
    if @@actions.has_key?(@action)
      puts @@actions[@action]
    elsif @action == "look"
      @current_room.enter
    elsif @action == "go forward"
      puts "You move deeper into the dungeon."
      next_room_position = @map.my_position
      @current_room = @map.next_room(next_room_position)
    elsif @action == "go back"
      puts "You retreat to a previous room in the dungeon."
      last_room_position = @map.my_position
      @current_room = @map.last_room(last_room_position)
    else
      puts "I don't know what you mean!"
    end
  end

end
