class Sentence
  attr_reader :subject, :verb, :object

  def initialize(subject, verb, obj)
    @subject = subject[1]
    @verb = verb[1]
    @object = obj[1]
  end
end

  def parse_sentence(word_list)
    subj = parse_subject(word_list)
    verb = parse_verb(word_list)
    obj = parse_object(word_list)
    Sentence.new(subj, verb, obj)
  end

  def peek(word_list)
    if word_list
      word = word_list[0]
      word[0]
    else
      nil
    end
  end

  def match(word_list, expecting)
    if word_list
      check_word_and_expecting(word_list, expecting)
    else
      nil
    end
  end

  def check_word_and_expecting(word_list, expecting)
    word = word_list.shift
    if word[0] == expecting
      word
    else
      nil
    end
  end

  def skip(word_list, word_type)
    while peek(word_list) == word_type
      match(word_list, word_type)
    end
  end

  def skip_stop(word_list)
    skip(word_list, 'stop')
  end

  def parse_verb(word_list)
    skip_stop(word_list)
    if peek(word_list) == 'verb'
      match(word_list, 'verb')
    else
      raise ParserError.new("Expecting a verb next.")
    end
  end

  def parse_object(word_list)
    skip_stop(word_list)
    next_word = peek(word_list)
    if peek(word_list) == 'noun'
      match(word_list, 'noun')
    elsif next_word == 'direction'
      match(word_list, 'direction')
    else
      raise ParserError.new("Expected a noun or direction next.")
    end
  end

  def parse_subject(word_list)
    skip_stop(word_list)
    next_word = peek(word_list)
    if next_word == 'noun'
      match(word_list, 'noun')
    elsif next_word == 'verb'
      ['noun', 'player']
    else
      raise ParserError.new("Expected a verb next.")
    end
  end
