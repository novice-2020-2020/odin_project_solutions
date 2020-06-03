require 'json'
class Hangman
  attr_reader :word, :alphabets, :correct_guesses, :incorrect_guesses, :counter, :guess, :saved_file

  def initialize
    @word = words.sample
    @counter = 7
    @correct_guesses = []
    @incorrect_guesses = []
    @saved_file = {}
    @guess = ''
    @alphabets = ('a'..'z').to_a
    @word.size.times do 
      @guess += "_"
    end
  end

  def words
    ['xyz']
  end


  def begin
    puts "new game beginning"
    puts "the word is #{@word.size} letters long"
    while @counter > 0
    get_input
    if check_game
        puts "You won, congrats!"
        @counter = 0
        puts "the secret word was #{@word}"
    elsif @counter == 0 && check_game == false
        puts "Sorry, you lost!"
      end
    end
    @saved_file[:word] = @word
    @saved_file[:counter] = @counter
    @saved_file[:alphabets] = @alphabets
    @saved_file[:correct] = @correct_guesses
    @saved_file[:incorrect] = @incorrect_guesses
    @saved_file[:guess] = @guess
    puts "please enter the the name by which you want to save the file"
  file_name = gets.chomp.to_s.concat('.json')
  File.open(file_name,"wb"){ |file| file.puts JSON.pretty_generate(@saved_file) }

  end

  def get_input
    if @counter > 0
    puts "please enter your guess no. #{8-@counter}"
    inp = gets.chomp.to_s
    if @word.include?(inp) && @alphabets.include?(inp)
      
      pos = find_index(@word,inp)
      pos.each {|i| @guess[i] = inp}
      puts "good guess"
      @alphabets.delete(inp)
      @correct_guesses << inp
    else
      @counter-=1
      @alphabets.delete(inp)
      @incorrect_guesses << inp
      puts "incorrect guess, you have #{@counter} chances left"
      
    end
  end


  end

  def find_index(str,inp)
    ar = []
    str.split('').each_with_index{|let, idx| ar.push(idx) if let == inp }
    ar
  end
  def check_game
    @guess == @word
  end

end


a = Hangman.new
a.begin



#improvements
#1/ ask at every turn whether the player wants to continue or save and exit
#2/ load a previously saved game
#3/ load a list of valid words