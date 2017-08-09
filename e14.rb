'''
euler 14
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
'''

def next_collatz(n)
  if (n%2 == 0)
    return n/2
  else
    return 3*n+1
  end
end

longest = 0
counter = 1
winning_num = 0
x = 1
while counter < 1000000
  x = counter
  chain = 1
  while x > 1
    x = next_collatz(x)
    chain+=1
  end
  #print("N: ", counter, " Had a chain of: ",chain,"\n")
  if (chain > longest)
    longest = chain
    winning_num=counter
  end
  counter+=1
end
print("longest: ",longest," winningnum: ",winning_num,"\n") #Note this is the number that produces the longest chain, not the length of chain