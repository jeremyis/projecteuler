fs = require 'fs'

file = fs.readFileSync '13-numbers.txt', 'utf8'
numbers = file.split('\n')

y = 0
for x in numbers
  y += Number(x)
console.log y
