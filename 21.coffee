###
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
###

# Go through numbers n - 1...1000
# Get all the prope divisors.
# Compute and save this sum d. as d(a)
# Go through saved list of sums, and find amicable numbers (d[a] === d[ d[a] ])


properDivisors = {}
findProperDivisorsSum = (n) ->
  sum = 0
  divisors = []
  for x in [1..Math.floor(n/2)]
    if x % n is 0
      sum += x
      divisors.push(x)
      properDivisors[ n ] = divisors

  return sum

maxSum = 0
maxA = -1

end = 10000
sums = {}
for x in [1...end]
  sums[x] = findProperDivisorsSum(x)
  if sums[x] > maxSum
    maxSum = sums[x]
    maxA = x

amicable = {}

for a in [1...Math.ceil(end / 2)]
  d_a = sums[a]
  if d_a < end
    if d_a is sums[ d_a ]
      amicable[a] = true
      amicable[d_a] = true

sum = 0
for k, v of amicable
  sum += Number(k)
  console.log "#{k} => #{v}"
  console.log properDivisors[k]

console.log '--------'
console.log sum


