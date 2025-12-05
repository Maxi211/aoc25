
lines = File.readlines('test.txt', chomp: true)
lines = File.readlines('input.txt', chomp: true)

ranges = []
ids = []
end_of_ranges_reached = false
count=0

lines.each do |line|
  if line.empty?
    end_of_ranges_reached = true
    next
  end
  if end_of_ranges_reached
    ids << line.to_i
  else
    ray = line.split("-").map(&:to_i)
    ranges << (ray[0]..ray[1])
  end
end


ids.each do |id|
  count += 1 if ranges.any?{_1.cover? id}
end


puts count