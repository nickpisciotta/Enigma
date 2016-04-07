require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_can_create_a_rotation_given_a_key
    k = KeyGenerator.new(4152115).key

    assert_equal "41", k[0..1]
    assert_equal "15", k[1..2]
    assert_equal "52", k[2..3]
    assert_equal "21", k[3..4]
    assert_equal "11", k[4..5]
    assert_equal "15", k[5..6]
  end

  def test_creating_new_key
    key1 = KeyGenerator.new

    assert key1.key

  end

  def test_when_including_a_key
    key1 = KeyGenerator.new(6789093)
    key2 = KeyGenerator.new(4567854)

    assert_equal "6789093", key1.key
    assert_equal "4567854", key2.key
  end

  def test_key_is_6_digits
    kg = KeyGenerator.new

    assert_equal 7, kg.key.length
  end

end
