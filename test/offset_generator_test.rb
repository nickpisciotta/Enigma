require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_generator.rb'

class OffsetGeneratorTest < Minitest::Test

  def test_a_rotation
    a = OffsetGenerator.new("1234567", "111111")

    assert_equal 18, a.a_rotation
  end

  def test_b_rotation
    b = OffsetGenerator.new("1234567", "111111")

    assert_equal 28, b.b_rotation
  end

  def test_c_rotation
    c = OffsetGenerator.new("1234567", "111111")

    assert_equal 38, c.c_rotation
  end

  def test_d_rotation
    d = OffsetGenerator.new("1234567", "111111")

    assert_equal 48, d.d_rotation
  end

  def test_e_roation
    e = OffsetGenerator.new("1234567", "111111")

    assert_equal 58, e.e_rotation
  end

  def test_f_rotation
    f = OffsetGenerator.new("1234567", "111111")

    assert_equal 68, f.f_rotation
  end


end
