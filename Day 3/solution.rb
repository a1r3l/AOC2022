
input = File.open('data.txt').readlines

def priority(item)
  return item[0].ord - 96 if item == item.downcase
  item[0].ord - 38
end

# Part 1
part_1_sum = 0
input.each do |line|
  fh, sh = *line[0, line.size / 2], line[line.size / 2..-1]
  repeated = fh.split('').select { |item| sh.include?(item) }.first
  part_1_sum += priority(repeated)
end

puts part_1_sum

# Part 2
part_2_sum = 0
input.each_slice(3) do |c|
  repeated = c[0].split('')
                     .select { |i| c[1].include?(i) && c[2].include?(i) }
                     .first
  part_2_sum += priority(repeated)
end

puts part_2_sum
