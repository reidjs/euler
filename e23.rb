'''
A perfect number is a number for which the sum of its proper divisors is exactly
 equal to the number. For example, the sum of the proper divisors of 28 would be
  1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
 and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number
that can be written as the sum of two abundant numbers is 24. By mathematical
analysis, it can be shown that all integers greater than 28123 can be written
as the sum of two abundant numbers. However, this upper limit cannot be reduced
 any further by analysis even though it is known that the greatest number that
 cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of
 two abundant numbers.

 Does not work 
'''

def abundant?(n)
  sum = 0
  x = divisors(n)
  x.each do |i|
    sum += i
  end
  sum > n ? true : false
end
def divisors(n)
  i = 1
  divs = []
  while i < n
    if n % i == 0
       divs << i
    end
    i+=1
  end
  divs
end
def equal?(actual, expected)
  if actual == expected
    return true
  end
  p "Failed, " +actual.to_s+ " is not equal to "+expected.to_s
  false
end

#try all values in arr. if any two can be summed to equal n, return true. else false
def can_be_summed_by_two_abunds?(n, arr)
  i = 0
  while i < arr.length-1
    j = i+1
    while j < arr.length
      if arr[i] + arr[j] == n
        return true
      end
      j+=1
    end
    i+=1
  end
  return false
end

i = 0
sum = 0
abundant_nums = []
while i < 28123
  if !can_be_summed_by_two_abunds?(i, abundant_nums)
    sum += i
  end
  if abundant?(i)
    abundant_nums << i
  end
  i+=1
end
p sum
#p equal?(abundant?(12), true)
