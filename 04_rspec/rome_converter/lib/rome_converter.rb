# PUT YOUR OWN FILE HERE

class RomeConverter
  ROME_NUMBERS = {
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

  def to_rome dec_num
    rome = ''
    ROME_NUMBERS.each do |value, letter|
      rome << letter * (dec_num / value)
      dec_num %= value
    end
    rome
  end

  def to_dec rome_str
    0
  end
end
