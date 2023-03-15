def key_word
  word_list = File.read('words.txt').split
  word = ''
  word = word_list.sample until 4 < word.length && word.length < 13
end

class Game
  def initialize
    @key = key_word
    @guesses_remaining = 10
    @key_clues = ''
    @key.length.times { @key_clues << '_' }
    @letters_guessed = []
  end
end
