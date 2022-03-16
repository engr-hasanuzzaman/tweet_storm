module TestDataGenerator
  def self.random_word(length = 40)
    source = ("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_", "-", "."]
    key = ""
    length.times { key += source[rand(source.size)].to_s }
    return key
  end

  def self.random_text(length = 200)
    max_word_size = 30
    text = ''
    while text.size < length
      str = random_word(rand(max_word_size))
      if text.empty?
        text = str
      else
        text = "#{text} #{str}"
      end
    end

    text[0...length]
  end
end
