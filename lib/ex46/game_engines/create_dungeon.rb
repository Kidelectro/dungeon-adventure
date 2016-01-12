class CreateDungeon
  attr_accessor :dungeon_deck, :floor_map
  #randomly creates a list of pathway rooms and inserts them into a hash and arranges them from beginning
  #to end.
  #ex = {"Entrance" => Entrance.new,
        #"Corridor" => Corridor.new,
        #"Cess Pool" => Cesspool.new}
  #creates each of the room objects and passes in the rooms each exit leads to
  ROOMS = {1 => CessPool,
           2 => StraightCorridor,
           3 => TwoRoomCorridor,
           4 => Chasm,
           5 => LeftCorner,
           6 => BoneRoom,
           7 => RightCorner}

  def self.dungeon_deck
    @deck
  end

  def self.floor_map
    create_room_list(5)
    @deck.map {|n| n.object_id}
  end

  def self.create_room_list(num)
    @deck = [Entrance.new]
    x = 1
    while x <= num do
      @deck << random_room
      x += 1
    end
    @deck << DownFloor.new
    @deck
  end

  def self.random_room
    key = rand(1..7)
    if ROOMS.has_key?(key)
      ROOMS[key].new
    end
  end


  #Each room object initializes the objects held within that room.
  #pathway rooms also can create dead_end rooms for exploration that will be connected to
  #the originating pathway room.
end
