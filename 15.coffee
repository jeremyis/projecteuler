# <rightMoves, downMoves>
# if rightMoves < 20, spawn <rightMoves - 1, downMoves>
# if downMoves < 20, spawn <rightMoves, downMoves - 1>
# if downMoves && rightMoves == 20, add One

subs = {}
count = 0
move = (down, right) ->
  #console.log "#{down}, #{right}"
  if "#{down}-#{right}" of subs
    count += subs["#{down}-#{right}"]
    return
  if down > 0
    move(down-1, right)
  if right > 0
    move(down, right-1)
  if down is 0 and right is 0
    count++

calculate = (j, k) ->
  for i in [0..j]
    for j in [0..k]
      move(i, j)
      subs["#{i}-#{j}"] = count
      count = 0

calculate(20, 20)
console.log subs["20-20"]

