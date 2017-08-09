'''
A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?
'''
require 'benchmark'
def digit_sum(n)
    s = 0
    n.to_s.chars.each do |i|
        s += i.to_i
    end 
    s
end 
max = 0
a = 1
#b = 2
s = 0
#try a 1-100
#try b 1-100
while a < 100
    b = 1
    while b < 100
        #p a**b
        s = digit_sum(a**b)
        #p s
        if s > max
            max = s
        end 
        b += 1
    end 
    a += 1 
end 
p max