module Scrabble
  class Word
    attr_reader :word, :score

    def initialize(word)
      @word = word
      @score = Scoring.score(@word)
    end
  end

  class Scoring

    LETTER_SCORING = {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 5,
      "L" => 1,
      "M" => 3,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 10,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 4,
      "X" => 8,
      "Y" => 4,
      "Z" => 10,
    }

    def self.score(word)
      word = word.upcase!
  	  word_array = word.split("") # could use .chars here
  	  score_value = 0

      # applies 50 point bonus for words >= 7 letters
  	  amount_of_loops = word_array.length
  	   if amount_of_loops >= 7
  	     score_value +=50
  	   end

  	   word_array.each do |letter|
  	     LETTER_SCORING.each do |hash_letter, point_value|
  		     if hash_letter == letter
  		        score_value += point_value
  		     end
  		   end
  	   end
      score_value.to_i
    end
  end
end
