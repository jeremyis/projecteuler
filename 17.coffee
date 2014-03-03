###
if the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
###
ones = [
  'one'
  'two'
  'three'
  'four'
  'five'
  'six'
  'seven'
  'eight'
  'nine'
  'ten'
]

teens = [
  'eleven'
  'twelve'
  'thirteen'
  'fourteen'
  'fifteen'
  'sixteen'
  'seventeen'
  'eighteen'
  'nineteen'
]

tens = [
  'ten'
  'twenty'
  'thirty'
  'forty'
  'fifty'
  'sixty'
  'seventy'
  'eighty'
  'ninety'
]


SPACES = false
spacer = if SPACES then ' ' else ''
#'three hundred and seventy four'
toString = (x) ->
  if x < 0 then return 'Really small'
  if x > 999 then return 'Really BIG!'
  pieces = []

  if x > 99
    part = Math.floor(x / 100)
    pieces.push ones[ part - 1 ]
    pieces.push 'hundred'
    x = x % 100
    pieces.push 'and' if x > 0

  if x > 19
    pieces.push tens[ Math.floor(x / 10) - 1 ]
    x = x % 10
  else if 10 < x < 20
    pieces.push teens[ (x % 10) - 1 ]
    return pieces.join spacer

  pieces.push ones[ x - 1 ] if x isnt 0

  return pieces.join spacer

test = (x) ->
  console.log "#{x} is '#{val = toString(x)}'"
  val
amount = 'onethousand'.length
i = 999
while i > 0
  amount += test(i).length
  i--
console.log amount


###
test = (x) ->
  console.log "#{x} is '#{toString(x)}'"

test(1)
test(2)
test(10)
test(17)
test(19)
test(24)
test(70)
test(166)
test(742)
test(132)
test(999)
###
