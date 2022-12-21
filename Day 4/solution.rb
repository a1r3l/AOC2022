def elf_sections_range(range)
  first, last = range.split('-').map(&:to_i)
  (first..last).to_a
end

def sections_overlaped?(section1, section2)
  (section1 & section2) == section1
end

def sections_fully_overlaped?(section1, section2)
  sections_overlaped?(section1, section2) || sections_overlaped?(section2, section1)
end

def sections_partialy_overlaped?(section1, section2)
  !(section1 & section2).empty?
end

fully_contained_sections = 0
contained_sections = 0

File.open('data.txt').readlines.each do |line|
  elf_1_sections = elf_sections_range(line.split(',').first)
  elf_2_sections = elf_sections_range(line.split(',').last)

  fully_contained_sections += 1 if sections_fully_overlaped?(elf_1_sections, elf_2_sections)
  contained_sections += 1 if sections_partialy_overlaped?(elf_1_sections, elf_2_sections)
end

puts "Part 1 -> Fully contained sections: #{fully_contained_sections}"
puts "Part 2 -> Contained sections: #{contained_sections}"
