require 'pry'
# require 'song'


class Maze
  @@currentRoom = 0
  @@description = ["WatchTower", "Bedroom", "Library", "Theatre", "Den","Living Room", "Poker Room", "Resteroom", "Dojo", "Yoga Room", "Closet", "Exit"]

  def initialize()
    # @deadRoom = [, ,]
  end

  def self.change_room(direction)
    if direction == "left"
      if @@currentRoom == 0  || @@currentRoom % 4 == 0
        return nil
      else
        @@currentRoom -= 1
        return @@description[@@currentRoom]
      end
    elsif direction == "right"
      if @@currentRoom == 3 || @@currentRoom == 7 || @@currentRoom == 11
        return nil
      else
        @@currentRoom += 1
        return @@description[@@currentRoom]
      end
    elsif direction == "up"
      if @@currentRoom >= 0 && @@currentRoom < 3
        return nil
      else
        @@currentRoom -= 4
        return @@description[@@currentRoom]
      end
    elsif direction == "down"
      if @@currentRoom > 7 && @@currentRoom <= 11
        return nil
      else
        @@currentRoom += 4
        return @@description[@@currentRoom]
      end
    end
  end


  def self.currentRoom
    @@description[@@currentRoom]
  end



end
