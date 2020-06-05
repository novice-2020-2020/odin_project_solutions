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
    valid_words = []
    file = File.open("a.txt","r")
    while !file.eof?
      line = file.readline
      if line.size>=5 && line.size<=12
      valid_words.push(line[0..line.size-3])
      end
    end
    valid_words
    # ['abc','xyz','def']
  end


  def begin
    puts "new game beginning"
    puts "the word is #{@word.size} letters long"
    while @counter > 0
    get_input
    puts @guess
    if @counter != 0 && check_game == false && save_game == true
      p "player wants to save the game"
      save
    else
      p "players no"
      if check_game
          puts "You won, congrats!"
          @counter = 0
          puts "the secret word was #{@word}"
          save
      elsif @counter == 0 && check_game == false
          puts "Sorry, you lost!, the word waas #{@word}"
          save
        end
      end
      
    end

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

  def save_game
    puts "do you want to save the game - y/n"
    ans = gets.chomp.to_s
    if ans == 'y'
      true
    else
      false
    end
  end

  def save
      p "please enter the name of the saved game"
      name_file = gets.chomp.to_s.concat('.json')
      @saved_file[:word] = @word
      @saved_file[:counter] = @counter
      @saved_file[:alphabets] = @alphabets
      @saved_file[:correct] = @correct_guesses
      @saved_file[:incorrect] = @incorrect_guesses
      @saved_file[:guess] = @guess
      File.open(name_file,"wb"){ |file| file.puts JSON.pretty_generate(@saved_file) }
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