a, b, c = ARGV.map(&:to_i).take(3)

d = (b ** b) - (4 * a * c)

if d >= 0
  d_sqrt = Math.sqrt(d)

  if d > 0
    x1 = (-b + d_sqrt) / (a * 2)
    x2 = (-b - d_sqrt) / (a * 2)

    puts "#{x1.round(2)}, #{x2.round(2)}"
  else
    x = -b / (a * 2)

    puts x.round(2)
  end
else
  puts 'No real solutions.'
end
