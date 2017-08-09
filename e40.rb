'''
Champernownes constant
Problem 40
An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
'''
#a tempting brute force approach
#c = "0."
#i = 1
#while i < 10000000
#  c += i.to_s
#  i += 1
#end

#actually, notice the pattern and notice everytime we increase by an order of magnitude
#we need to only store the value if it is one of the numbers we are looking for
'''
idxs = [1, 10, 100, 1000, 10000, 100000, 1000000]
i = 1 #loop number counter
prod = 1
index = 1
c = "0"
while i <= 1000001
  s = i.to_s #we need to check each digit in the string
  #p s
  #c += s
  s.chars.each_index do |j|
    if idxs.include?(index)
      prod *= s[j].to_i
    end
    index += 1 #this is the current place in the constant
  end
  i+=1
end
p prod
'''

#actually let's just write all the numbers to a file then search through for the relevant spaces
#first we create the file (approx 6mb)
# File.open("champernownes", "a") do |f|
#   i = 0
#   while i < 1000000
#     f<<i.to_s
#     i+=1
#   end
# end

#then we read into the file and at every relevant index we will multiply our product
idxs = [1, 10, 100, 1000, 10000, 100000, 1000000]
prod = 1
File.open("champernownes", "r") do |f|
  i = 0
  f.each_char do |c|
    if idxs.include?(i)
      prod *= c.to_i
    end
    i+=1
  end
end
p prod
