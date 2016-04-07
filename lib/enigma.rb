# require_relative "key_generator"
# require_relative "date_generator"
require_relative "cipher"
require_relative "offset_generator"
require "Date"

class Enigma
  attr_reader :cipher, :date, :key, :encrypted_message, :og

  def initialize(key = nil, date = nil)
    @encrypted_message = []
    @cipher = Cipher.new
    @og = OffsetGenerator.new
  end

  # def a_rotation
  #   key[0..1].to_i + date[0].to_i
  # end
  #
  # def b_rotation
  #   key[1..2].to_i + date[1].to_i
  # end
  #
  # def c_rotation
  #  key[2..3].to_i + date[2].to_i
  # end
  #
  # def d_rotation
  #  key[3..4].to_i + date[3].to_i
  # end
  #
  # def e_rotation
  #   key[4..5].to_i + date[4].to_i
  # end
  #
  # def f_rotation
  #   key[5..6].to_i + date[5].to_i
  # end

  def encrypt(message, key = @key, date = @date)
    @key = key.to_s
    @date = DateGenerator.new.given_date(date.to_i) if date != @date
    chunk_message = []
    message.downcase!
    message.split("").each_slice(6) {|a| chunk_message << a }
    chunk_message.each do |chunk|
      rotate_chunk(@og.a_rotation, chunk[0])
      rotate_chunk(@og.b_rotation, chunk[1])
      rotate_chunk(@og.c_rotation, chunk[2])
      rotate_chunk(@og.d_rotation, chunk[3])
      rotate_chunk(@og.e_rotation, chunk[4])
      rotate_chunk(@og.f_rotation, chunk[5])
    end
    encrypted_message.flatten.join
  end

  def decrypt(message, key, date = @date)
    @key = key.to_s
    @date = DateGenerator.new.given_date(date.to_i) if date != @date
    chunk_message = []
    message.downcase!
    message.split("").each_slice(6) {|a| chunk_message << a }
    chunk_message.each do |chunk|
      rotate_chunk(- @og.a_rotation, chunk[0])
      rotate_chunk(- @og.b_rotation, chunk[1])
      rotate_chunk(- @og.c_rotation, chunk[2])
      rotate_chunk(- @og.d_rotation, chunk[3])
      rotate_chunk(- @og.e_rotation, chunk[4])
      rotate_chunk(- @og.f_rotation, chunk[5])
    end
    encrypted_message.flatten.join
  end

  def rotate_chunk(letter_rotation, chunk_position)
    cipher.rotate_characters(letter_rotation)
    encrypted_message << cipher.rotated_pairs[chunk_position]
  end


#puts e.encrypt("thanks", "123456", "111111")
end

e = Enigma.new

puts e.encrypt("message", "1234567", "060416")
puts e.key
puts e.date
#puts e.decrypt(output, "123456")
