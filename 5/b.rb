
lines = File.readlines('test.txt', chomp: true)
lines = File.readlines('input.txt', chomp: true)

ranges = []

lines.each do |line|
  break if line.empty?
  ranges << Range.new(*line.split("-").map(&:to_i))
end

ranges_reduced = [ranges[0]]

ranges[1..].each do |range|

  overlap = ranges_reduced.select{_1.overlap?(range)}
  ranges_reduced = ranges_reduced - overlap
  
  overlap << range

  ranges_reduced << ((overlap.map{_1.first}.min)..(overlap.map{_1.end}.max))
end

puts ranges_reduced.sum{(_1.end) - (_1.first) + 1}
