'''
Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method
is to use a password as a key. If the password is shorter than the message,
which is likely, the key is repeated cyclically throughout the message.
The balance for this method is using a sufficiently long password key
 for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower
case characters. Using cipher.txt (right click and, a file containing the
  encrypted ASCII codes, and the knowledge that the plain text must contain
  common English words, decrypt the message and find the sum of the ASCII values
  in the original text.
'''
#TO DO
'''
ANSWER: encrypted with "god"
(The Gospel of John, chapter 1) 1 In the beginning the Word already existed.
He was with God, and he was God. 2 He was in the beginning with God.
3 He created everything there is. Nothing exists that he didnt make.
 4 Life itself was in him, and this life gives light to everyone.
5 The light shines through the darkness, and the darkn...

to see the solution simply call try_password_loop with the file header "head"

'''
f = IO.readlines("p059_cipher.txt")
#read just the first part and split by commas into our array
entire_file = f[0].split(',')
entire_file.each_index do |i|
  entire_file[i] = entire_file[i].to_i
end
head = f[0].slice(0,900).split(',') #make number smaller if this is taking too long
#for each index in i, turn it to
head.each_index do |i|
   head[i] = head[i].to_i
 end
#read through the document three characters at a time decrypting and converting


#use XOR to convert
#send in the bytes and password as ASCII number
def xor_decrypt(bytes, password)
  decrypt = ""
  pw_index = 0 #keeps track of index to cycle password

  bytes.each do |i|
    decrypt += (i ^ password[pw_index]).to_s + "," #run xor operation
    pw_index += 1
    #loop over the password if it reaches its limit
    if pw_index > password.length - 1
      pw_index = 0
    end
  end
  #returns as a string of ascii values
  decrypt
end
#send in l as array ['b', 'c', 'f']
#WARNING: only works for three digit passwords
def to_ascii(l)
  [l[0].ord, l[1].ord, l[2].ord]
end
#go from string of comma separated ascii codes to characters
def to_chars(str)
  c = ''
  str.split(',').each do |i|
    c += i.to_i.chr
  end
  c
end

def try_password_loop(text_array_in_ascii)
  #'a' is 97
  #'z' is 122
  #must try every number
  pw = [97, 97, 97]
  #last pw is [122, 122, 122]
  i = 97
  while i < 123
    j = 97
    while j < 123
      k = 97
      while k < 123
        converted = to_chars(xor_decrypt(text_array_in_ascii, [i, j, k]))
        if converted.include?("that")
          p [i,j,k]
          p converted
        end
        k+=1
      end
      j+=1
      end
    i+=1
  end
end
#try_password_loop(a)
#now decrypt and find sum of values
sum = 0
xor_decrypt(entire_file, to_ascii(["g", "o", "d"])).split(',').each do |i|
  sum += i.to_i
end
p sum
# p to_chars(xor_decrypt(a, [122,103,101]))

#print out each byte
#f = File.open("p059_cipher.txt", "r+")
#f.each_byte{|ch| putc ch}
