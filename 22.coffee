###
For example, when the list is sorted into alphabetical order, COLIN, which is
worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
###
fs = require 'fs'

file = fs.readFileSync('names.txt', 'utf8')
content = (x.replace(/"/g, '').trim() for x in file.split(","))
content = content.sort()

getCharNum = (str, i) ->
  val = str.toUpperCase().charCodeAt(i) - 64
  if val < 0
    throw Error("Odd ASCII char! #{str}, #{i}")
  return val

getNameWorth = (name) ->
  sum = 0
  for i in [0...name.length]
    sum += getCharNum(name, i)
  return sum

amount = 0
for val, i in content
  amount += (i + 1) * getNameWorth(val)

console.log amount

