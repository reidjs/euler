'''
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
'''

def to_letters(num)
    w = {1 => 3, 2 => 3, 3 => 5, 4 => 4, 5 => 4, 6 => 3, 7 => 5, 8 => 5, 9 => 4, 10 => 3, 11 => 6, 12 => 6, 13 => 8, 14 => 4+4, 15=>3+4, 16 => 3+4, 17=> 5+4, 18=> 5+4, 19=>4+4, :ty => 2, 20 => 6, 30 => 6, 40 => 5, 50 => 5, 80 => 6, :hundred => 7, :thousand => 8, :and => 3}
    #check if it's a teen
    teen = (num > 11 && num < 19) 
    num = num.to_s
    #split into its parts 
    thousands = num[-4].to_i * 1000
    hundreds = num[-3].to_i * 100 
    tens = num[-2].to_i * 10
    ones = num[-1].to_i
    #turn back to integer 
    num = num.to_i
    sum = 0
    if teen
        sum += w[num]
    end 
    if ones > 0 && !teen 
        sum += w[ones]  
    end 
    if tens > 0  && !teen
        #special cases for twenty, thirty, etc. 
        if !w[tens].nil? 
            sum += w[tens]
        #four ty  six ty  seven ty etc. 
        else 
            sum += w[tens/10] 
            sum += w[:ty]
        end 
    end 
    if hundreds > 0
        sum += w[hundreds/100]
        sum += w[:hundred]
        sum += w[:and] if tens > 0 || ones > 0
    end 
    if thousands > 0
        sum += w[thousands/1000]
        sum += w[:thousand]
        #sum += w[:and] if hundreds == 0
    end 
    sum 
end 

def letters_in_range_inclusive(s, e)
    overall = 0
    i = s
    while i < e+1
        overall += to_letters(i)
        i+=1
    end 
    return overall
end 

def assertEqual(actual,expected)
    if actual != expected
        return false
    else
        return true 
    end 
end 

p assertEqual(to_letters(1000), 11)
p assertEqual(to_letters(349), 24)
p assertEqual(to_letters(13), 8)
p assertEqual(to_letters(342), 23)
p assertEqual(to_letters(115), 20)
p assertEqual(letters_in_range_inclusive(1, 5), 19)
p letters_in_range_inclusive(1,1000)