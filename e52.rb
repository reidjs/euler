'''
It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
'''
def same_digits?(x, y)
  x.to_s.chars.sort == y.to_s.chars.sort
end 
def multiples_same?(x)
  same_digits?(x, 2*x) && same_digits?(x, 3*x) && same_digits?(x, 4*x) && same_digits?(x, 5*x) && same_digits?(x, 6*x)
end 
i = 1
while !multiples_same?(i)
  i+=1
end
p i