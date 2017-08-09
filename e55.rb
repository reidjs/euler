'''
If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.

Not all numbers produce palindromes so quickly. For example,

349 + 943 = 1292,
1292 + 2921 = 4213
4213 + 3124 = 7337

That is, 349 took three iterations to arrive at a palindrome.

Although no one has proved it yet, it is thought that some numbers, like 196, never produce a palindrome. A number that never forms a palindrome through the reverse and add process is called a Lychrel number. Due to the theoretical nature of these numbers, and for the purpose of this problem, we shall assume that a number is Lychrel until proven otherwise. In addition you are given that for every number below ten-thousand, it will either (i) become a palindrome in less than fifty iterations, or, (ii) no one, with all the computing power that exists, has managed so far to map it to a palindrome. In fact, 10677 is the first number to be shown to require over fifty iterations before producing a palindrome: 4668731596684224866951378664 (53 iterations, 28-digits).

Surprisingly, there are palindromic numbers that are themselves Lychrel numbers; the first example is 4994.

How many Lychrel numbers are there below ten-thousand?
'''
def reverse(n)
  n.to_s.reverse.to_i
end
def isPal?(n)
  n == reverse(n)
end
#reverses and sums
def flipSum(n)
  n + reverse(n)
end
#try all numbers up to 10k
#flipsum 50 times and check if its pal
#if it reaches 50 it is a lychrel
lychrels = []
i = 0
while i < 10000
  j = 0
  n = flipSum(i)
  while !isPal?(n) && j < 50
    n = flipSum(n)
    j+=1
  end
  if (j == 50)
    lychrels << n
  end
  i+=1
end
p lychrels.size
