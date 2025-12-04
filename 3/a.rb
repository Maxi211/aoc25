
lines = File.readlines('test.txt', chomp: true)
lines = File.readlines('input.txt', chomp: true)

batteries = lines.map{_1.split('').map(&:to_i)}

sum = 0

batteries.each do |battery|
  first_digit = 0
  first_digit_index = 0
  second_digit = 0
  battery.each.with_index do |digit,i|
    if digit > first_digit && i < ((battery.length) - 1)
      first_digit = digit 
      first_digit_index = i
    end
  end
  
  battery[(first_digit_index+1)..-1].each do |digit|
    second_digit = digit if digit > second_digit
  end

  sum += ((first_digit*10) + second_digit)
end

puts sum

