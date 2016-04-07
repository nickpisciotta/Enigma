
class KeyGenerator
  attr_reader :key

  def initialize(key = nil)
    return @key = generate_key if key.nil?
    @key = key.to_s
  end

  def generate_key
     rand(99999).to_s.rjust(7,"00000")
  end
end
