require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/maze.rb')


get('/') do
  @room = Maze.currentRoom
  # binding.pry
  erb(:room_display)
end

post('/change_room') do
  direction = params[:direction]
  @room = Maze.change_room(direction)
  @currentRoom = Maze.currentRoom
  erb(:room_display)
end
