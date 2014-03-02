maxNum = 0

getCollatzLength = (x) ->
  length = 1
  while x > 1
    maxNum = if x > maxNum then x else maxNum
    if x of subs
      #console.log " ret #{length + subs[x]}"
      return length + subs[x]
    else if x % 2 is 0
      x = x / 2
      #console.log " EVEN x = #{x}"
    else
      x = 3*x + 1
      #console.log " ODD x = #{x}"
    length++
  return length


maxLength = 0
maxStart = -1

subs = {}
start = 1
while start < 1000000
  length = getCollatzLength(start)
  #console.log "#{start} -> #{length}"
  subs[start] = length
  if length > maxLength
    maxLength = length
    maxStart = start
  start++

  if start % 1000 is 0
    console.log "at #{start}, #{maxStart} was #{maxLength} terms"

console.log "#{maxStart} was #{maxLength} terms. Max: #{maxNum}"
