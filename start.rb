require 'bundler'
Bundler.require(:default)
require 'sinatra/reloader'
require_relative 'GameOfLife.rb'

GAME_SIZE = 30
game = GameOfLife.new(GAME_SIZE, GAME_SIZE)

get '/' do
  game.set_board(Array.new(GAME_SIZE) { Array.new(GAME_SIZE) { 0 } })
  @board = game.get_board
  erb :index
end

get '/random' do
  game.in_the_beginning
  @board = game.get_board
  erb :index
end

post '/' do
  new_cycle = Array.new(GAME_SIZE) { Array.new(GAME_SIZE) { 0 } }
  unless params[:box].nil?
    for i in 0..GAME_SIZE - 1
      for k in 0..GAME_SIZE - 1
        if params[:box].include? i.to_s+k.to_s
          new_cycle[i][k] = 1
        end
      end
    end
  end
  puts new_cycle.map { |x| x.join(' ') }
  game.set_board(new_cycle)
  game.life_cycle
  @board = game.get_board
  erb :index
end

