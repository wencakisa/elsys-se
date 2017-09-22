require 'json'

def get_solutions(a, b, c)
  d = (b ** 2) - (4 * a  * c)
  result = {
    :x1 => nil,
    :x2 => nil,
    :d => d
  }

  if d >= 0
    d_sqrt = Math.sqrt(d)

    if d > 0
      result[:x1] = (-b + d_sqrt) / (a * 2)
      result[:x2] = (-b - d_sqrt) / (a * 2)
    else
      result[:x1] = result[:x2] = -b / (a * 2)
    end
  end

  result
end

def write_solutions(solutions_hash, filename)
  File.open(filename, 'w') do |f|
    f.write(JSON.pretty_generate(solutions_hash))
  end

  "Solution successfully written in #{filename}."
end

filename = ARGV.first
file = File.read(filename)
hash = JSON.parse(file)

solutions = get_solutions(hash['a'], hash['b'], hash['c'])
puts write_solutions(solutions, './output.json')
