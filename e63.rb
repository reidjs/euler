# # The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number,
#  134217728=8^9, is a ninth power.
# # How many n-digit positive integers exist which are also an nth power?
#Successful!
def count_digits(n)
  return n.to_s.length
end
def digit_length_equals_power?(base, power)
  return count_digits(base**power) == power
end
power = 1
cases = 0
#number of digits in the base can never be greater than the power
#power increases UNTIL the number of digits of base**power has surpassed it.
while count_digits(2**power) <= power && count_digits(9**power) >= power
  base = 1

  while count_digits(base**power) <= power
    if digit_length_equals_power?(base,power)
      cases += 1
    end
    print base, " ", power, " ", count_digits(base**power)
    puts " "
    base += 1
  end
  power += 1
end
p cases
# p digit_length_equals_power?(7, 5)
