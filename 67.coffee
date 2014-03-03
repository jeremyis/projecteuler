fs = require 'fs'

# pyramid = [[75], [95, 64], ...]
pyramid = (x.split(' ') for x in fs.readFileSync('67triangle.txt', 'utf8').split("\n"))
pyramid = pyramid[0..pyramid.length - 2]

#console.log pyramid[99]


mem = {}
score = (i, j)->
  #console.log "score(#{i}, #{j})"
  if i + 1 is pyramid.length
    #console.log " = #{pyramid[i][j]}"
    return Number(pyramid[i][j])

  old = mem["#{i}-#{j}"]
  return old if old?
  mem["#{i}-#{j}"] = Number(pyramid[i][j]) + Math.max( score( i + 1, j ), score( i + 1, j + 1) )

console.log score(0, 0)
