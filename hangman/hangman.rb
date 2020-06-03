require 'json'

$valid_words = []
file = File.open("a.txt", 'r')
while !file.eof?
   line = file.readline
   $valid_words.push(line[0..line.size-3])
end

$counter = 1
$secret_word = Array($valid_words[rand($valid_words.size)].downcase.split(''))    
$correct_guess = []
$incorrect_guess = []
$guess_array = Array.new($secret_word.size,'_')

def hangman()
  saved_file = {}
  saved_file['secret_word'] = $secret_word
  
  def find_index(str,inp)
    ar = []
    $secret_word.each_with_index{|let, idx| ar.push(idx) if let == inp }
    ar
  end

  alphabets = [*("a".."z")]
  puts $secret_word.join('')
  puts "please enter your guess no. #{$counter}"
  inp = gets.chomp.downcase
  
  def check_input(inp, word, incorrect, correct, alpha, counter, guess)
    # p incorrect.include?(inp) || correct.include?(inp)
    if incorrect.include?(inp) || correct.include?(inp)
      $counter+=1
    else
      if !word.include?(inp)
            puts "incorrect guess"
            incorrect.push(inp)
            alpha.delete(inp)    
            $counter+=1
        else
          puts 'correct guess'  
          correct.push(inp)
            pos = find_index(word,inp)
            pos.each {|i| guess[i] = inp}
            alpha.delete(inp)
        end
    end
end
  
  check_input(inp, $secret_word, $incorrect_guess, $correct_guess, alphabets, $counter, $guess_array)  

  puts "Incorrect guesses are #{$incorrect_guess}"
  puts "Correct guesses are #{$correct_guess}"
  puts "Current guess is #{$guess_array.join('')}"
  puts "you have #{7-$counter} chance(s) left"
  # puts "equality is #{$guess_array == $secret_word}"
  if $guess_array == $secret_word
    p "You won"
    saved_file['correct_guess'] = $correct_guess
    saved_file['incorrect_guess'] = $incorrect_guess
    saved_file['counter'] = $counter
    saved_file['current_guess'] = $guess_array
    d = Date.today.to_time.to_i.to_s.concat('.json')
    file = File.new(d,"w")
    File.open(file,"w") do |f|

    f.write(saved_file.to_json)
    end
  elsif $counter == 7
    p "Hang the man"
    saved_file['correct_guess'] = $correct_guess
    saved_file['incorrect_guess'] = $incorrect_guess
    saved_file['counter'] = $counter
    saved_file['current_guess'] = $guess_array
    d = Date.today.to_time.to_i.to_s.concat('.json')
    file = File.new(d,"w")
    File.open(file,"w") do |f|
    f.write(saved_file.to_json)
    end
  end
  puts "_____________________________________________________"
  puts (saved_file.to_json)

end

until $counter == 7 || $guess_array == $secret_word do
  hangman
end