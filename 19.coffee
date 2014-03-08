###
1 Jan 1900 was a Monday.

Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.

- A leap year occurs on any year evenly divisible by 4,
  but not on a century unless it is divisible by 400.

Q: How many Sundays fell on the first of the month during the twentieth century
  (1 Jan 1901 to 31 Dec 2000)?
###

totalDays = 1
day = 1
month = 1
year = 1900

firstSundays = 0

isLeapYear = ->
  if year % 100 is 0
    if year % 400 is 0 then return true
    return false
  year % 4 is 0

daysInMonth = ->
  if month in [ 9, 4, 6, 11 ] then return 30
  if month is 2
    if isLeapYear() then return 29
    return 28
  return 31

incrementMonth = ->
  # If at december, increment year
  if month is 12
    month = 1
    year++
    console.log "! New Year: #{year}. First Sundays: #{firstSundays}. Total days: #{totalDays}"
  else
    month++
  day = 1

incrementDay = ->
  # If at max days in month, incrementMonth
  if day is daysInMonth()
    incrementMonth()
  else
    day++
  totalDays++
  console.log "Increment Days: #{month} / #{day} / #{year}"

while year < 2001
  if year > 1900
    if day is 1 and (totalDays % 7) is 0
      firstSundays++
      console.log "** First Sunday #{month} / #{day} / #{year}"
  incrementDay()

console.log "#{firstSundays}"
