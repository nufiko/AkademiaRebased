class Tictactoe
	def initialize
		@board = Array.new(3){Array.new(3) {' '}}
	end
	
	def printBoard
		puts ' A B C'
		for i in 0..2
			puts '-------'
			puts "|#{@board[0][i]}|#{@board[1][i]}|#{@board[2][i]}| #{i+1}"
		end
		puts '-------'
	end
	
	
	def whoWins()
		for i in 0..2
			if isColumn(i) or isRow(i)
				return true
			end
		end
		if isDiagonal()
			return true
		end
		return false
	end
	
	def isDiagonal()
		if ((@board [0][0] == @board [1][1] and @board [0][0] == @board [2][2]) or (@board [0][2] == @board [1][1] and @board [0][2] == @board [2][0])) and @board[1][1] != ' '
			return true
		end
		return false
	end
	
	def isRow (x)
		if (@board [x][0] == @board [x][1] and @board [x][0] == @board [x][2]) and @board[x][0] != ' '
			return true
		else
			return false
		end
	end
	
	def isColumn(y)
		if (@board [0][y] == @board [1][y] and @board [0][y] == @board [2][y]) and @board[0][y] != ' '
			return true
		else
			return false
		end
	end
	
	def addSymbol (x,y, player)
		if x<0 or x>2 or y<0 or y>2
			return false
		end
		if @board[x][y] == ' '
			@board[x][y] = player
			return true
		end
		return false
	end
	
	def setPosition(player)
		a = gets.upcase	
		b = { 'A' => 0, 'B' => 1, 'C' => 2 }
		if b[a[0]] == nil or ( a[1].to_i < 0 and a[1].to_i > 2)
			return false
		end
		addSymbol(b[a[0]] , a[1].to_i-1, player)
	end
	
	def startGame()
		counter = 0
		gracz = 'x'
		begin
			begin
				system ('cls')
				printBoard()
				if counter%2 == 0
					gracz = 'X'
				else
					gracz = 'O'
				end
				puts "podaj współżedne pola graczu #{gracz}"
				pozycja = setPosition(gracz)
			end while !pozycja
			counter += 1
		end while (!whoWins() and counter<9) 
		
		if counter<9
			puts "Gratuluje wygrał gracz #{gracz}"
		else
			puts "REMIS"
		end
	end
	
end


