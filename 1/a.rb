
instructions = File.readlines('test.txt', chomp: true)
instructions = File.readlines('input.txt', chomp: true)
current = 50
count = 0 

instructions.each do |command|
  
  number = command[1..].to_i
  number = number % 100

  if command.start_with? "R"
    current += number
  else
    current -= number
  end
  
  current = current%100
  
  count += 1 if current == 0
end

puts count