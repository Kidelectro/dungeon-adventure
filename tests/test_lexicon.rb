require "./lib/ex46/lexicon.rb"
require "test/unit"

class TestLexicon < Test::Unit::TestCase
  test 'lexicon scans directions' do
    result = Lexicon.scan("north south east")
    assert_equal(Lexicon.scan("north"), [['directions', 'north']])
    assert_equal(result, [['directions', 'north'],
           ['directions', 'south'],
           ['directions', 'east']])
  end

  test 'lexicon scans verbs' do
    assert_equal(Lexicon.scan("go"), [['verbs', 'go']])
    result = Lexicon.scan("go kill eat")
    assert_equal(result, [['verbs', 'go'],
           ['verbs', 'kill'],
           ['verbs', 'eat']])
  end


  test 'Lexicon scans stops' do
    assert_equal(Lexicon.scan("the"), [['stops', 'the']])
    result = Lexicon.scan("the in of")
    assert_equal(result, [['stops', 'the'],
           ['stops', 'in'],
           ['stops', 'of']])
  end


  test 'Lexicon scans nouns' do
    assert_equal(Lexicon.scan("bear"), [['nouns', 'bear']])
    result = Lexicon.scan("bear princess")
    assert_equal(result, [['nouns', 'bear'],
                          ['nouns', 'princess']])
  end

  test 'Lexicon scans numbers' do
    result = Lexicon.scan("3 91234")
    assert_equal(Lexicon.scan("1234"), [['number', 1234]])
    assert_equal(result, [['number', 3],
                          ['number', 91234]])
  end

  test 'Lexicon returns errors' do
    result = Lexicon.scan("bear IAS princess")
    assert_equal(Lexicon.scan("ASDFADFASDF"), [['error', 'asdfadfasdf']])
    assert_equal(result, [['nouns', 'bear'],
           ['error', 'ias'],
           ['nouns', 'princess']])
  end

end
