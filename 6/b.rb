
lines = File.readlines('test.txt', chomp: false)
lines = File.readlines('input.txt', chomp: true)

instructions = lines.pop.split(" ")
numberstrings = lines.map{_1.split("")}.transpose

total=0
index = 0

numberstrings.each.with_index do |numberstring|
  number = numberstring.filter{_1.strip.length>0}.join("").to_i
  
  if number == 0
    total += subtotal
    index += 1
    subtotal = nil
    next
  end
  
  if instructions[index] == '*'
    subtotal ||= 1
    subtotal = subtotal * number
  elsif instructions[index] == '+'
    subtotal ||= 0
    subtotal += number
  else
    raise "HELL NAH"
  end
end

total += subtotal

puts total
