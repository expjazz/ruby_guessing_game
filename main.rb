require_relative "./logic"

hangman = Hangman.new

until hangman.game_over?
  puts "Incorrect Guesses Remaining: #{hangman.remaining_incorrect_guesses}"
  puts "Attempted Chars: #{hangman.attempted_chars}"
  puts "Word: #{hangman.guess}"
  print "\n" until hangman.ask_user
end