# Quadratic Diophantine has form: x^2 – Dy^2 = 1
# Start w/ x = 1 and go through y until y > (1- x^2)/D

isInt = (x) -> x - Math.floor(x) is 0

squares = []

# TODO: is this right? I don't know...
findLargerSquare = (x) ->
  # Binary search mofo!
  i = 0
  j = squares.length - 1
  while i < j
    k = Math.floor((j + i) / 2)
    if squares[k] < x
      j = k - 1
    else
      i = k + 1
  return squares[i]

biggestSquare = 0
getNextSquare = (x) ->
  while squares[ squares.length - 1] < x
    biggestSquare++
    squares.push biggestSquare*biggestSquare
  findLargerSquare(x)


# Returns square root if x is a square, otherwise false
sqrts = {}
getSquareRtIfSquare = (x) ->
  return sqrts[x] if squares[x]?
  sqrt = Math.sqrt(x)
  sqrts[x] = if isInt sqrt then sqrt else false

getMinimalSolution = (d) ->

  # No solutions when D is a square.
  if isInt Math.sqrt d then return null

  # (1) y = Math.sqrt( (x^2 - 1) / d)
  # (2) So, for y to be an integer x^2 - 1 > d
  # (3) or, x > Math.sqrt(d + 1)
  x = Math.ceil(Math.sqrt(d + 1))
  while true
    # TODO: Optimization. Have a function that gives the next number that is
    # a square equal or greater than (x*x - 1) / d (binary search?)
    y_squared = (x*x - 1) / d
    y = getSquareRtIfSquare y_squared
    break if y and isInt y

    x++
  return [x, y]

test = (d) ->
  soln = getMinimalSolution(d)
  soln ?= "None"
  console.log "#{d}: #{soln}"
  return soln

maxX = -1
maxD = -1
for d in [2..1000]
  val = test(d)

  if val?
    [x, y] = val
    if x > maxX
      maxD = d
      maxX = x

console.log "d: #{maxD} has x #{maxX}"

