require_relative 'GameOfLife.rb'

system('cls')

game = GameOfLife.new(15, 15)

game.in_the_beginning

begin
  system('cls')
  game.display
  game.life_cycle
end while gets.upcase[0] != 'C'
