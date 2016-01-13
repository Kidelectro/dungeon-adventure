class Map

  attr_accessor :rooms

  def initialize(room_position)
    @rooms = CreateDungeon::create_room_list(5)
    @room_position = room_position
  end

  def next_room(room_position)
    next_room = @rooms[room_position + 1]
    if room_position + 1 > @rooms.length - 1
      next_room = @rooms.last
      next_room
    else
      @room_position = room_position + 1
      next_room
    end
  end

  def last_room(room_position)
    last_room = @rooms[room_position - 1]
    if room_position -1 < 0
      last_room = @rooms.first
      last_room
    else
      @room_position = room_position - 1
      last_room
    end
  end

  def opening_room
    @rooms[0]
  end

  def dungeon_end
    @rooms.last
  end

  def my_position
    @room_position
  end

end
