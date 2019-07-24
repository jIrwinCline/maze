require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/maze.rb')


get('/') do
  maze = Maze.new(1,
    {"WatchTower" => [1,0,0,1], "Bedroom" => [1,1,0,0], "Library" => [1,1,0,1], "Theatre" => [1,1,0,1], "Den" => [0,0,0,1],"Living Room" => [0,1,1,0], "Poker Room" => [0,0,0,1], "Resteroom" => [0,1,0,0], "Dojo" => [0,0,1,1], "Yoga Room" => [1,0,1,0], "Closet" => [0,1,1,0], "Foyer" => [0,0,0,1]}
  )
  @room = maze.get_room_description
  # binding.pry
  erb(:room_display)
end

post('/change_room') do
  direction = params[:direction]
  maze = Maze.getMaze
  if(maze.check_timeEnd)
    erb(:fail)
  else
    @room = maze.change_room(direction)
    @current_room = maze.get_room_description
    erb(:room_display)
  end
end
