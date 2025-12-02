
lines = File.readlines('test.txt', chomp: true)
lines = File.readlines('input.txt', chomp: true)

id_ranges = lines.first.split(',')

invalid_ids = []

id_ranges.each do |r|
  a,b=r.split('-').map(&:to_i)
  (a..b).each do |id|
    id = id.to_s
    next unless id.length.even?
    half = id.length/2
    invalid_ids << id.to_i if id[0...half] == id[half..-1]
  end
end

puts invalid_ids.sum