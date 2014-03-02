# Come up with triangle numbers.
triNums = [ 1 ]
triCount = 1

factors = []

findNextTriNum = ->
  num = triNums[ triNums.length - 1  ] + (++triCount)
  triNums.push( num )
  num

getNumFactors = (n) ->
  factors = 2
  i = 2
  while i <= n / 2
    #if factors.length < i
    if n % i is 0 then factors++
    i++
  return factors

t0 = new Date().getTime()
i = 1
while true
  num = findNextTriNum()
  factors = getNumFactors num
  #factors.push(num)
  if factors  > 100*i
    t1 = new Date().getTime()
    console.log "#{num}, #{factors}, #{t1 - t0}"
    i += 1
    t0 = t1
  break if factors  > 500
console.log "#{num}, #{factors}"
