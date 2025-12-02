
lines = File.readlines('test.txt', chomp: true)
lines = File.readlines('input.txt', chomp: true)

id_ranges = lines.first.split(',')

invalid_ids = []

id_ranges.each do |r|
  a,b=r.split('-').map(&:to_i)
  (a..b).each do |id|
    id = id.to_s
    
    next if id.size == 1
    possible_substrings=[]

    ((id.length)/2).times do |i|
      first = id[0,i+1]
      last = id[-(i+1),i+1]
      possible_substrings<< first if first == last
    end

    possible_substrings.each do |ps|
      mult = id.length/ps.length.to_f
      
      next unless mult.to_i == mult
      
      if ps*mult == id
        invalid_ids<< id.to_i
        break
      end
    end
  end
end

puts invalid_ids.sum
