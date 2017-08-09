# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2 × 7
# 15 = 3 × 5
#
# The first three consecutive numbers to have three distinct prime factors are:
#
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
#
# Find the first four consecutive integers to have four distinct prime factors each.
# What is the first of these numbers?
require 'prime'
#return number of factors
def primeFactors(n)
  i = 2
  npf = 0 #number of prime factors
  while i < n-1
    if n % i == 0 && Prime.prime?(i)
      npf += 1
    end
    i+=1
  end
  npf
end
#how many consecutive numbers should have how many primes
#e.g., 4, 3 would be four consecutive numbers with 3 prime factors each
def consecutivePrimesFactors(numbers, primes)
  consec = 0
  nums = []
  i = 0
  while consec < numbers
    #if we have the number of p factors we're looking for
    if primeFactors(i) == primes
      consec += 1
      nums << i
    #otherwise, reset the counter
    else
      consec = 0
      nums = []
    end
    i+=1
  end
  #return the numbers
  nums
end
p consecutivePrimesFactors(4,4)
