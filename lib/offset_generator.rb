require "./lib/key_generator"
require "./lib/date_generator"

class OffsetGenerator
  attr_reader :key, :date

  def initialize(key = nil, date = nil)
    @key = (key || KeyGenerator.new.key)
    @date = DateGenerator.new(date).date
  end

  def a_rotation
    key[0..1].to_i + date[0].to_i
  end

  def b_rotation
    key[1..2].to_i + date[1].to_i
  end

  def c_rotation
   key[2..3].to_i + date[2].to_i
  end

  def d_rotation
   key[3..4].to_i + date[3].to_i
  end

  def e_rotation
    key[4..5].to_i + date[4].to_i
  end

  def f_rotation
    key[5..6].to_i + date[5].to_i
  end

end

o = OffsetGenerator.new
puts o.a_rotation
