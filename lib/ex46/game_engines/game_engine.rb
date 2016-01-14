class GameEngine
  @@actions = { "dance" => "You do a little dance.",
                "fart" => "You let out a big fart!",
                "directions" => ["make simple sentences to do stuff",
                                  "Ex: go forward, move forward, or take doorway to move forward",
                                  "go back to move back",
                                  "quit to quit"]}
  $movement = "go forward"

  def initialize(map)
    @map = map
  end

  def play
    @action = nil
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
    #dynamic_player_input
    @action = gets.chomp.downcase
    if @@actions.has_key?(@action)
      puts @@actions[@action]
    elsif @action == $movement
      puts "You move deeper into the dungeon."
      next_room_position = @map.my_position
      @current_room = @map.next_room(next_room_position)
      $movement = "go forward"
    elsif @action == "go back"
      puts "You retreat to a previous room in the dungeon."
      last_room_position = @map.my_position
      @current_room = @map.last_room(last_room_position)
    else
      puts "I don't know what you mean!"
    end
  end

  # def dynamic_player_input
  #   player_input = gets.chomp.downcase
  #   input_through_lexicon = Lexicon::scan(player_input)
  #   @action = Sentence::parse_sentence(input_through_lexicon)
  # end

end
