def permute(str, l, r)
  counter = 0
  if (l == r)
    print(str)
    return 0
  else
    for i in l..r
      str[l], str[i] = str[i], str[l]
      permute(str, l+1, r)
      str[l], str[i] = str[i], str[l]
    end
  end
end
size = 2
array = []
for i in 0..size-1
  array << 'd'
  array << 'r'
end
#print(array)
#array = ['d','d','d','r','r','r']
#permute(array,0,array.length-1)
if (permute(array,0,array.length-1) == 0)
  print("a")
end



