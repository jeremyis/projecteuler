# 100 * 99 = 9900
# [ 0, 0, 9, 9]
# 9900 * 98 = 970200 = 98 * ( 98*9*10^3 + 98*10^2) = [ 0, 2, 8, 8] + [2, 8, 8] =
# 882
#  9 * 98 = 882
#  9 * 98 = 882
#  9 * 0 = 0
#  9 * 0 = 0

# Multiplies arr by d when 0 < d < 10
multiplySingleDigit = (d, arr) ->
  if not (0 < d < 10) then throw Error "Invalid value of d: #{d} on multiplySingledigit"
  prod = []

  carry = 0
  for x in arr
    p = x * d + carry
    carry = Math.floor(p / 10)
    prod.push( p % 10 )
  if carry > 0 then prod.push(carry)

  return prod

combine = (arr1, arr2) ->
  sum = []
  [inner, outer] = if arr1.length > arr2.length then [arr1, arr2] else [arr2, arr1]

  carry = 0
  for x, i in outer
    d = outer[i] + inner[i] + carry
    carry = Math.floor(d / 10)
    sum.push(d % 10)

  while i < inner.length
    s = carry + inner[i]
    sum.push( s % 10 )
    carry = Math.floor(s / 10)
    i++
  if carry > 0 then sum.push(carry)
  return sum

multiplyBy = (d, arr) ->
  tens = Math.floor( d / 10 )
  singles = d % 10

  tenSum = if tens isnt 0
    prod = multiplySingleDigit(tens, arr)
    [0].concat(prod) # Incrase by 10x
  else []

  sinSum = if singles isnt 0
     multiplySingleDigit(singles, arr)
  else
    []
  if tenSum.length > 0 and sinSum.length > 0
    combine(tenSum, sinSum)
  else if sinSum.length > 0
    sinSum
  else
    tenSum

  #100*99 = 9900 = [ 9, 9, 0, 0]
  # 98*(99*100) = 98*9900 = (90 * 9900 + 8 * 9900) = 9 * [9, 9, 0, 0] shift by
  # 1) do tens * array, shift by 1
  # 2) do ones * array
  # 3) add two arrays together


prod = [ 0, 0, 1 ]
count = 99
while count > 1
  prod = multiplyBy count, prod
  console.log "*=#{count} = #{prod}"
  count--

sum = 0
sum += x for x in prod
console.log "sum: #{sum}"

