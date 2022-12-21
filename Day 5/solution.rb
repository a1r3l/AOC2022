require 'pry'

class Stacks
  def initialize(size)
    @attribute = attribute
  end

  def move(stack1, stack2)
  end
end

def parse_staks_arangement(staks_definition)
  structure = []
end

document = File.open('data.txt').read

staks, moves_matrix = document.split("\n\n")
staks_structure = parse_staks_arangement(staks)

puts staks
puts moves_matrix

# puts "Part 1 -> Crates on TOP list: #{result}"
