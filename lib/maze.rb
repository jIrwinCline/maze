require 'pry'
require 'time'
# require 'song'


class Maze
  @@Mazes = []
  @@currentMaze = 0

  attr_accessor :current_room, :description

  def initialize(current_room, rooms)
    @current_room = current_room
    @directions = ["up", "right", "down", "left"]
    @rooms = rooms
    @@Mazes.push(self)
    @endTime = Time.now.strftime("%S").to_i + 5
  end

  def start_time
    time = Time.now.strftime("%S")
    @endTime = time.to_i + 5

  end
  def check_timeEnd
    compareTime = Time.now.strftime("%S").to_i
    return compareTime >= @endTime
  end

  def check_win(direction)
    @current_room == @rooms.length-1 && (direction == "down" || direction == "right")
  end

  def check_wall(direction)
    walls = @rooms[@rooms.keys[@current_room]]
    wallToGoThrough = @directions.index(direction)
    return walls[wallToGoThrough] == 1
  end

  def self.getMaze
    @@Mazes[@@currentMaze]
  end

  def get_room_description
    @rooms.keys[@current_room]
  end


  def change_room(direction)
    if(check_wall(direction))
      return nil
    end

    if(check_win(direction))
      @current_room = 1
      return "You made it outside. Nice."
    end

    if direction == "left"
      if @current_room == 0  || @current_room % 4 == 0
        return nil
      else
        @current_room -= 1
        return get_room_description
      end
    elsif direction == "right"
      if @current_room == 3 || @current_room == 7 || @current_room == 11
        return nil
      else
        @current_room += 1
        return get_room_description
      end
    elsif direction == "up"
      if @current_room >= 0 && @current_room < 3
        return nil
      else
        @current_room -= 4
        return get_room_description
      end
    elsif direction == "down"
      if @current_room > 7 && @current_room <= 11
        return nil
      else
        @current_room += 4
        return get_room_description
      end
    end
  end


  # def self.currentRoom
  #   @rooms[@current_room]
  # end
  #


end
