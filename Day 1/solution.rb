
elfs_data, elf_energy = [], 0
File.open('data.txt').readlines.each do |line|
  elf_energy += line.strip.to_i

  next unless line.length == 1

  elfs_data << elf_energy
  elf_energy = 0
end

puts "Elf maximum energy is: #{elfs_data.max} "
