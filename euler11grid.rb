#Euler 11 What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?

z = [[],[]]
linenum = 0
f = File.open("grid", "r")
f.each_line do |line|
  #puts line.class
  x = line.split
  for i in 0..x.length
    x[i] = x[i].to_i
  end
  z[linenum] = x
  linenum+=1
end
f.close

for i in 0..z.length-1
  #print(z[i],"\n")
  
  #for j in 0..z[0].length-1
    #z[i][j] = (z[i][j])
  #end
end

def right(z)
  n = 0
  m = 0
  for i in 0..z.length-1
    for j in 0..z[0].length-4
      n = z[i][j]*z[i][j+1]*z[i][j+2]*z[i][j+3]
      #print(n, "\n")
      if n > m
        m = n
      end
    end
    #print(z[i][0..z.length-4],"\n")
  end
  return m
end

def down(z)
  n = 0
  m = 0
  for i in 0..z.length-4
    for j in 0..z[0].length-1
      n = z[i][j]*z[i+1][j]*z[i+2][j]*z[i+3][j]
      #print(n, "\n")
      if n > m
        m = n
      end
    end
  end
  return m
end

def diagright(z)
  n = 0
  m = 0
  for i in 0..z.length-4
    for j in 0..z[0].length-4
      n = z[i][j]*z[i+1][j+1]*z[i+2][j+2]*z[i+3][j+3]
      #print(n, "\n")
      if n > m
        m = n
      end
    end
  end
  return m
end
def diagleft(z)
  n = 0
  m = 0
  for i in 0..z.length-4
    for j in 3..z[0].length-1
      n = z[i][j]*z[i+1][j-1]*z[i+2][j-2]*z[i+3][j-3]
      print(n, " ", i, " ", j, "\n")
      if n > m
        m = n
      end
    end
  end
  return m
end
puts diagleft(z)
