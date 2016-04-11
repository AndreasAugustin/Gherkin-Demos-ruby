class MySoundex
  def initialize
    @max_code_length = 4
    @not_a_digit = '*'
    @empty_string = ''
    @encodingsMap = {
        'b' => '1', 'f' => '1', 'p' => '1', 'v' => '1',
        'c' => '2', 'g' => '2', 'j' => '2', 'k' => '2', 'q' => '2', 's' => '2', 'x' => '2', 'z' => '2',
        'd' => '3', 't' => '3',
        'l' => '4',
        'm' => '5', 'n' => '5',
        'r' => '6'
    }
  end

  # @param [String] word
  # @return [String] the encoded word
  def encode(word)
    zero_pad(remove_not_a_digit(upper_front(head(word)) + tail(encoded_digits(word))))
  end

  # @param [Char] character
  # @return [Char]
  def encoded_digit(character)
    if @encodingsMap.has_key?(character)
      return @encodingsMap[character]
    end
    @not_a_digit
  end

  private

  def encoded_digits(word)
    encoding = encode_head(word)
    encoding += encode_tail(encoding, word)
  end

  def encode_head(word)
    if word.length == 0
      return @empty_string
    end
    encoded_digit(word[0])
  end

  def remove_not_a_digit(word)
    ret = ''
    word[0..-1].split('').each do |c|
      if c != @not_a_digit
        ret += c
      end
      end
      ret
  end

  def encode_tail(encoding, word)
    char_accessor = word[0]
    word[1..-1].split('').each do |c|
      if !is_complete(encoding)
        encoding = encode_letter(encoding, c, char_accessor)
        char_accessor = c
      end
    end

    encoding
  end

  def encode_letter(encoding, letter, last_letter)
    digit = encoded_digit(letter)
    if digit != @not_a_digit && (digit != last_digit(encoding) || is_vowel(last_letter))
      encoding += digit
    end

    encoding
  end

  def last_digit(encoding)
    encoding_len = encoding.length
    if encoding_len == 0
      return @not_a_digit
    end

    encoding[encoding_len - 1]
  end

  def is_complete(encoding)
    encoding.length == @max_code_length
  end

  def lower(character)
    character.downcase
  end

  def upper_front(string)
    string[0].upcase
  end

  def head(string)
    string[0]
  end

  def tail(word)
    word_length = word.length
    if word_length < 1
      return @empty_string
    end

    word[1, word_length - 1]
  end

  def zero_pad(word)
    zeros_needed = @max_code_length - word.length

    [*1..zeros_needed].each do |x|
      word += '0'
    end

    word
  end

  def is_vowel(letter)
    'aeiouy'.include? letter
  end

end
