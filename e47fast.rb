#https://projecteuler.net/thread=47;page=3
require 'mathn'

i = 1

loop do
  a,b,c,d = [ i.prime_division,
              (i+1).prime_division,
              (i+2).prime_division,
              (i+3).prime_division ]

  if d.length != 4
    i += 4
  elsif c.length != 4
    i += 3
  elsif b.length != 4
    i += 2
  elsif a.length != 4
    i += 1
  else
    break
  end
end

puts i
