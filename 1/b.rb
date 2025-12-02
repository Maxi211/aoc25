
instructions = File.readlines('test.txt', chomp: true)
instructions = File.readlines('input.txt', chomp: true)
current = 50
count = 0 

instructions.each do |command|
  
  already_zero = current == 0
  number = command[1..].to_i
  count += number / 100
  number = number % 100

  if command.start_with? "R"
    current += number
  else
    current -= number
  end
  
  count += 1 if (current < 0 || current > 100) & !already_zero
  
  current = current%100
  
  count += 1 if current == 0
end

puts count