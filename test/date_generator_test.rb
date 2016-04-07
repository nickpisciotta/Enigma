require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/date_generator'
require 'Date'

class DateGeneratorTest < Minitest::Test

  def test_it_take_last_6_digits_of_squared_date
    d = DateGenerator.new("020315")

    assert_equal "699225", d.date
  end

  def test_given_date_method_returns_6_digits
    d = DateGenerator.new

    assert_equal 6, d.given_date("020315").length
  end

  def test_generate_date_method_returns_6_digits
    d = DateGenerator.new

    assert_equal 6, d.generate_date.length
  end

end


# def test_creating_date_generator
#   sample_date = Date.parse("04-04-2016")
#   date_last_digits = DateGenerator.new.generate_date(sample_date)
#   #require 'pry'; binding.pry
#   assert_equal "3056", date_last_digits
# end
