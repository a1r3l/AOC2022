LOSS = 0
DRAW = 3
WIN = 6

MOVE_POINTS = { rock: 1, paper: 2, scissors: 3 }

ORDER = %i[rock paper scissors]

def rps_win(move1, move2)
  return DRAW if move1 == move2

  idx = ORDER.index(move1)

  return move2 == ORDER[(idx + 1) % ORDER.length] ? WIN : LOSS
end

def score(move1, move2)
  MOVE_POINTS[move2] + rps_win(move1, move2)
end

def winning_move(move1, me)
  idx = ORDER.index(move1)

  case me
  when 'X'
    ORDER[idx - 1]
  when 'Y'
    move1
  when 'Z'
    ORDER[(idx + 1) % ORDER.length]
  end
end

file = File.open('data.txt')
total1 = 0
total2 = 0

file.readlines.each do |line|
  opponent, me = line.split(' ')
  move1 = ORDER[opponent.ord - 'A'.ord]
  move2 = ORDER[me.ord - 'X'.ord]

  total1 += score(move1, move2)
  total2 += score(move1, winning_move(move1, me))
end

file.close
puts total1
puts total2
