# Sum of the digits of 2^1000
# 1024
# 2048
# 4096
# 8192
# 16384

reverseDigits = [ 1 ]

double = ->
  carry = false
  i = 0
  while i < reverseDigits.length
    d = reverseDigits[i]
    d *= 2
    if carry then d = d + 1

    carry = d >= 10
    if carry then d -= 10

    reverseDigits[i] = d
    i++

  if carry then reverseDigits.push 1

x = 1000
while x > 0
  double()
  x--

sum = 0
sum += y for y in reverseDigits
console.log sum

