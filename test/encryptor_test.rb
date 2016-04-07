require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor.rb'

class EncyptorTest < Minitest::Test

  def test_it_can_assign_key
    e = Encryptor.new

    e.encrypt("message","1234567", "111111")

    assert_equal "1234567", e.keyword
  end


  def test_it_can_rotate_a_single_character
    e = Encryptor.new

    actual = e.encrypt("a", "123456", "111111")

    assert_equal "s", actual
  end

  def test_it_can_rotate_six_characters
    e = Encryptor.new

    actual = e.encrypt("abcdef", "123456", "111111")

    assert_equal "s3bmxm", actual
  end

  def test_it_can_rotate_extended_message
    e = Encryptor.new

    actual = e.encrypt("assignment for student", "123456", "111111")

    assert_equal "shrrzu46m2qm6g91,1v6m2", actual
  end


  def test_it_can_encrypt_without_given_date
    e = Encryptor.new

    actual = e.encrypt("assignment", "1234567")

    assert_equal "ohwp0i06r0", actual
  end
end
