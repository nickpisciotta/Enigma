require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_it_can_decrypt_single_letter
    e = Decryptor.new

    actual = e.decrypt("z", "1234567", "111111")
    assert_equal "h", actual
  end

  def test_it_can_decrypt_six_letters
    e = Decryptor.new

    actual = e.decrypt(".9,w3i", "1234567", "111111")

    assert_equal "thanks", actual
  end

  def test_it_can_decypt_extended_message
    e = Decryptor.new

    actual = e.decrypt("shrrzd46m2q86g91,kv6m2", "1234567", "111111")

    assert_equal "assignment for student", actual
  end

  def test_it_can_decrypt_without_provided_date
    e = Decryptor.new


    actual = e.decrypt("ohwp0i06r0", "1234567")

    assert_equal "assignment", actual
  end

end
