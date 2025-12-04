
lines = File.readlines('test.txt', chomp: true)
lines = File.readlines('input.txt', chomp: true)

batteries = lines.map{_1.split('').map(&:to_i)}
BATTERY_LENGTH = 12

def get_highest_number(remaining_battery:, result:[], battery_length: BATTERY_LENGTH)
  
  return result.join("").to_i if result.size == battery_length
  
  highest_digit = 0
  index = 0
  remaining_battery[0..-(battery_length-result.length)].each.with_index do |digit,i|
    if digit > highest_digit
      highest_digit = digit 
      index = i
    end
  end
  result << highest_digit
  remaining_battery = remaining_battery[index+1..-1]

  return(get_highest_number(remaining_battery: ,result: ))
end


puts batteries.sum{ |battery| get_highest_number(remaining_battery: battery ) }
