$counter = 0
$player_1 = []
$player_2 = []
$winner = []
$winning_combos = [[0,1,2],[3,4,5], [6,7,8], [0,3,6], [2,5,8],[1,4,7],  [0,4,8], [6,4,2]]
$board=Array.new(9, '-')
def game()
    
    puts "current turn is #{$counter+1}"

    
    

    def display_board(board)
    puts [" #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "]
    puts separator = "-----------"
    puts [" #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "]
    puts separator
    puts [" #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "]
    end


    $player_1_symbol = "O"
    $player_2_symbol = "X"
    

    def whos_turn(board)
        if $counter%2 == 0
            puts "player_1"
            return 1
        else
            puts "player_2"
            return 2
        end
    end


    def player_input(board)

        if $counter%2 == 0
            puts "please enter the number player 1"
        else
            puts "please enter the number player 2"
        end
        inp = gets.chomp.to_i-1
        valid = inp.between?(0,8) && (board[inp] == "-")
        while  valid == false
            puts "invalid"
            inp = gets.chomp.to_i-1
            valid = inp.between?(0,8) && (board[inp] == "-")
        end
        return inp
    end



    def add_to_board(board, idx, turn, p1, p1_symbol, p2, p2_symbol)
        if turn == 1
            p1.push(idx)
            board[idx] = p1_symbol
        elsif turn == 2
            p2.push(idx)
            board[idx] = p2_symbol
        end
    end

    add_to_board($board, player_input($board), whos_turn($board), $player_1, $player_1_symbol, $player_2, $player_2_symbol)
    
    def is_winner(turn, winning_combos, a, b)
        if turn == 1
            a.permutation(3).to_a.each do |let| 
                if winning_combos.include?(let)
                    puts "the winner is #{$player_1_symbol}, and winning combo is #{let}"
                    $winner << $player_1_symbol
                else
                    false
                end
            end
        else turn == 2
            b.permutation(3).to_a.each do |let| 
                if winning_combos.include?(let)
                    puts "the winner is #{$player_2_symbol}, and winning combo is #{let}"
                    $winner << $player_2_symbol
                else
                    false
                end
            end 
    end
    if $winner == []
      "no winner"
    else
      $winner
    end
      end   
    is_winner(whos_turn($board), $winning_combos, $player_1, $player_2)  
    $counter+=1
    puts "$player_1 = #{$player_1}"
    puts "$player_2 = #{$player_2}"
    puts "counter is #{$counter}"
  puts "winner is #{$winner}"
  display_board($board)
end

while $counter<9 && $winner == []
    game
end