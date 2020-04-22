class Hangman
  attr_accessor :secret_word, :guess, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["biblia", "galeria", "livro", "pai", "tangerina", "instagram", "globo", "amigos"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess = Array.new(@secret_word.size, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 8
  end

  def ask_user
    p 'Enter a char'
    char = gets.chomp
    try_guess(char)
  end

  def try_guess(char)
    if already_attempted(char)
      p 'Character already attempted. Please try another one'
      false
    elsif already_attempted(char) == false
      @attempted_chars << char
      if @secret_word.include?(char) == false
         @remaining_incorrect_guesses -= 1
      elsif @secret_word.include?(char)
         fill_indices(char, get_matching_indices(char))
      end
    end
    true
  end

  def already_attempted(char)
    if attempted_chars.include?(char)
      true
    else 
      false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.chars.each_with_index { |x, i| arr << i if x == char }
    arr
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess[i] = char }
  end

  def win?
    if @guess.join("") == @secret_word
      p 'Congratulations! You win!'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses.zero?
      p 'You lost. Try again.'
      true
    else
      false
    end
  end
  
  def game_over?
    if win? || lose?
      p "Here is the secret word: #{@secret_word}"
      true
    else
      false
    end
  end
end

