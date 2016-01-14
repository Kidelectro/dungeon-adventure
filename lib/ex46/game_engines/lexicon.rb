class Lexicon
  WORDS = {"directions" => ["north", "south", "east", "west", "down", "up",
                            "left", "right", "back", "forward"],
          "verbs" => ["go", "stop", "kill", "eat", "take", "move", "attack"],
          "stops" => ["the", "in", "of", "from", "at", "it"],
          "nouns" => ["door", "doorway", "bear", "princess", "cabinet", "path", "pathway"]}

  def self.scan(input)
    @result = []
    input.downcase.split.each do |word|
      compare_words(word)
      return_a_result_or_number(word)
    end
    @result
  end

  def self.return_a_result_or_number(word)
    if @included_word != []
      @result << @included_word
    else
      @result << convert_number(word)
    end
  end

  def self.compare_words(word)
    @included_word = []
    WORDS.each do |key, value|
      if value.include?(word)
        @included_word = [key, word]
      end
    end
  end

  def self.convert_number(word)
    begin
      return ["number", Integer(word)]
    rescue
      ["error", word]
    end
  end

end
