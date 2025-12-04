
lines = File.readlines('test.txt', chomp: true)
lines = File.readlines('input.txt', chomp: true)

area = lines.map{_1.gsub(/[@]/,'1')}.map{_1.gsub(/[.]/,'0')}.map{_1.split('')}.map{_1.map(&:to_i)}
reachable_count = 0
reachable_count_last_round = 0

loop do
  reachable_count_last_round = reachable_count
  area.each.with_index do |line, y|
    line.each.with_index do |value, x|

      next if value == 0
      x_start = x > 0 ? x-1 : x
      x_end = x < line.size ? x+1 : x
      y_start = y > 0 ? y-1 : y
      y_end = y < area.size ? y+1 : y

      if area[y_start..y_end].map{_1[x_start..x_end]}.flatten.sum < 5
        reachable_count+=1 
        area[y][x]=0
      end
    end
  end
  break if reachable_count == reachable_count_last_round
end

puts reachable_count






