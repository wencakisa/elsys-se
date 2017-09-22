require 'json'

def check_similarity(filename1, filename2)
  file1 = File.read filename1
  file2 = File.read filename2

  hash1 = JSON.parse(file1).sort_by {|k, v| k}
  hash2 = JSON.parse(file2).sort_by {|k, v| k}

  hash1 == hash2
end

filename1, filename2 = ARGV.take 2
puts check_similarity(filename1, filename2)
