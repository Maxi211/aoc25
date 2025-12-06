
lines = File.readlines('test.txt', chomp: true)
lines = File.readlines('input.txt', chomp: true)

instructions = lines.pop.split(" ")
columns = lines.map{_1.split(" ").map(&:to_i)}.transpose

total = 0
columns.each.with_index do |numbers, i|
  subtotal = 0
  if instructions[i] == '*'
    subtotal = 1
    numbers.each do |n|
      subtotal = subtotal * n
    end
  else
    numbers.each do |n|
      subtotal += n
    end
  end
  total += subtotal
end

puts total