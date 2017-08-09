'''
euler 15
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.


How many such routes are there through a 20×20 grid?
'''

g = Hash.new
size = 2
for i in 0..size
  for j in 0..size
    g[[i,j]] = 0
  end
end
headx = 0
heady = 0

#move all the way right till wall
#move all the way down till wall
"""
for i in 0..size
  headx = i
  heady = 0
end
for j in 0..size
  headx = size
  heady = j
end
"""
#move right one less than wall
#move down one 
#move right to wall
#move all the way down
'''
for i in 0..size-1
  headx = i
  heady = 0
  g[[headx,heady]] = "P"
end
heady+=1
g[[headx,heady]] = "P"
headx+=1
g[[headx,heady]] = "P"
heady+=1
g[[headx,heady]] = "P"
'''


#Move right one less than wall
#move down two
#move right to wall
#move all the way down
'''
for i in 0..size-1
  headx = i
  g[[headx,heady]] = "P"
end
for j in 0..size
  heady = j
  g[[headx, heady]] = "P"
end
headx+=1
g[[headx, heady]] = "P"

moves = size*size
g[[headx, heady]] += 1

c = 0  
downadj = 0
rightadj = 0
while(moves > 0)
  if headx < size - downadj
    headx += 1
  elsif heady < size
    heady += 1
  end
  g[[headx, heady]] += 1
  moves -= 1
  if downadj < size
    downadj += 1
  elsif rightadj < size
    rightadj += 1
end
'''
#string, starting index, ending index
def permute(str, l, r)
  if (l == r)
    print(str)
  else
    for i in l..r
      str[l], str[i] = str[i], str[l]
      permute(str, l+1, r)
      str[l], str[i] = str[i], str[l]
    end
  end
end
array = ['A','B','C']
permute(array,0,array.length-1)

  
  
def showtable(grid, size)
  for i in 0..size
    for j in 0..size
      print(grid[[i,j]])
    end
    print("\n")
  end
end
#showtable(g,size)