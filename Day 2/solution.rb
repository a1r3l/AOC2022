general_score = 0

def pick_score_mapping(pick)
  case pick
  when 'A', 'X'
    1
  when 'B', 'Y'
    2
  when 'C', 'Z'
    3
  end
end

def round_scores(pick_one, pick_two)
  [pick_score_mapping(pick_one), pick_score_mapping(pick_two)]
end

def round_result(rival_score, my_score)
  return 6 if my_score > rival_score
  return 3 if my_score == rival_score
  0
end
linc = 0
File.open('data.txt').readlines.each do |line|
  linc += 1
  rival_pick, my_pick = line.strip.split
  rival_score, my_score = round_scores(rival_pick, my_pick)
  general_score += round_result(rival_score, my_score) + my_score
end

puts "Final Score: #{general_score} #{linc}"
