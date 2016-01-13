load "./lib/ex46/monsters/monster.rb"
Dir["./lib/ex46/monsters/*.rb"].each { |file| load "#{file}" }
load "./lib/ex46/rooms/room.rb"
#room requires monster_table.rb
Dir["./lib/ex46/rooms/dead_ends/*.rb"].each { |file| load "#{file}" }
Dir["./lib/ex46/rooms/pathways/*.rb"].each { |file| load "#{file}" }
Dir["./lib/ex46/game_engines/*.rb"].each { |file| load "#{file}" }

# load "./bin/loadfiles.rb"

@map = Map.new(0)
@game = GameEngine.new(@map)
@game.play
