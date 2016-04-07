class Cipher
  attr_reader :rotated_pairs

  def initialize
    @rotated_pairs
  end

  def rotate_characters(rotation)
    characters = ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    # require 'pry';binding.pry
    rotated_characters = characters.rotate(rotation)
    @rotated_pairs = Hash[characters.zip(rotated_characters)]
  end

  # def rotate_characters_extension(rotation)
  #   characters = ("a".."z").to_a + ("0".."9").to_a + ("A".."Z").to_a + (" .,!@#$%^&*()[]<>;:/?\|").chars
  #   rotated_characters = characters.rotate(rotation)
  #   Hash[characters.zip(rotated_characters)]
  # end

end
