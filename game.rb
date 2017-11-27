require_relative 'tictactoe.rb'

system ('cls')
puts "Witaj w grze w kółko i krzyżyk"
gets

playAgain = false;
begin
	tictac = Tictactoe.new
	tictac.startGame()
	puts "Czy chcesz zagrać jeszcze raz? (T/N)"
	
	if gets.upcase[0] == 'T'
		playAgain = true
	else
		playAgain = false
	end
end while playAgain