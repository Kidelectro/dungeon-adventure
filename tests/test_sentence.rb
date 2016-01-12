require "./lib/ex46/sentence.rb"
require "test/unit"
require "./lib/ex46/parser.rb"

class TestSentence < Test::Unit::TestCase

  test 'the peek method returns the first array if it contains a value' do
    result = peek([['verb', 'run'], ['direction', 'north']])
    assert_equal result, 'verb'
  end

  test 'peek method returns nil if nothing in array' do
    result = peek([[], []])
    assert_equal nil, result
  end

  test 'match method returns a match' do
    result = match([['verb', 'run']], 'verb')
    assert_equal ["verb", "run"], result
  end

  test 'if word is not a match it returns nil' do
    result = check_word_and_expecting(([[], []]), "verb")
    assert_equal nil, result
  end

  test 'skip method will skip a value in the word list if it is told to skip' do
    result = skip(([['verb', 'run'], ['direction', 'north']]), 'direction')
    assert_equal nil, result
  end

  test 'skip_stop skips stop values' do
    result = skip_stop([["direction", "north"], ["verb", "run"], ["stop", "the"]])
    assert_equal nil, result
  end

  test 'a verb is parsed from a word list' do
    result = parse_verb([["verb", "run"], ["stop", "the"]])
    assert_equal ["verb", "run"], result
  end

  test 'an exception is raised when a verb is expected but not parsed' do
    assert_raises do
      parse_verb([["direction", "north"], ["verb", "run"], ["stop", "the"]])
    end
  end

  test 'an object is parsed from a word list if it is a noun' do
    result = parse_object([["noun", "bear"], ["verb", "kill"]])
    assert_equal ["noun", "bear"], result
  end

  test 'an object is parsed from a word list if it is a direction' do
    result = parse_object([["direction", "north"], ["noun", "bear"], ["verb", "kill"]])
    assert_equal ["direction", "north"], result
  end

  test 'an exception is raised when an object is expected but not parsed' do
    assert_raises do
      parse_object([["verb", "run"], ["stop", "the"]])
    end
  end

  test 'a subject is parsed if it is a noun' do
    result = parse_subject([["noun", "bear"], ["verb", "run"], ["stop", "the"]])
    assert_equal ["noun", "bear"], result
  end

  test 'if the next word to be parsed is a verb, the player object is implied' do
    result = parse_subject([["verb", "run"], ["stop", "the"]])
    assert_equal ['noun', 'player'], result
  end

  test 'an exception is raised when a subject cant be parsed' do
    assert_raises do
      parse_object([["verb", "run"], ["stop", "the"]])
    end
  end

  test 'a word list is parsed and assigned a subject of player' do
    result = parse_sentence([["verb", "run"], ["direction", "north"]])
    assert_equal "player", result.subject
  end

  test 'a word list is parsed and assigned a verb' do
    result = parse_sentence([["verb", "run"], ["direction", "north"]])
    assert_equal "run", result.verb
  end

  test 'a word list is parsed and assigned an object' do
    result = parse_sentence([["verb", "run"], ["direction", "north"]])
    assert_equal "north", result.object
  end
end
