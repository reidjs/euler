'''
Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
where each “_” is a single digit.

def check(n)
  v = (n*n).to_s.split('')
  #p v
  #remove all odd indexes
  no_odds = []
  v.each_index do |i|
    i % 2 == 0 ? no_odds << v[i] : nil
  end
  no_odds == ["1", "2", "3", "4","5","6","7","8","9","0"]
end
i = 3162277660
while !check(i)
  i += 1
end
p i
'''
#smarter strategy: try 0-9 in each spot and then sqrt and
#use num.instance_of? Fixnum to check if it's an integer
def check(n)
  Math.sqrt(n).instance_of? Fixnum
end
p check(100)
