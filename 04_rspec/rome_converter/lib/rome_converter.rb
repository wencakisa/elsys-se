class RomeConverter
  ROMAN_NUMBERS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def to_roman dec_num
    roman = ''
    ROMAN_NUMBERS.each do |value, letter|
      roman << letter * (dec_num / value)
      dec_num %= value
    end
    roman
  end

  def to_dec roman_str
    0
  end
end
