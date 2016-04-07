require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher.rb'

class CipherTest < Minitest::Test

  def test_rotate_characters
    c = Cipher.new
    c.rotate_characters(2)

    assert_equal "c", c.rotated_pairs["a"]
  end
end
