'''
Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt (right click and, a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.
'''
#TO DO 
'''
Write decryption algorithm to go from ASCII to plaintext
Write loop to go over all 3 letter passwords 
'''
f = IO.readlines("p059_cipher.txt") 
#read just the first part and split by commas into our array 
a = f[0].slice(0,100).split(',') #make 100 smaller if this is taking too long
a.each_index{|i| a[i] = i.to_i}
#use XOR to convert
#send in the bytes and password as ASCII
def xor_decrypt(bytes, password)
  decrypt = ""
  pw_index = 0 #keeps track of index to cycle password
  
  bytes.each do |i|
    decrypt += (i ^ password[pw_index]).to_s + ","
    pw_index += 1
    if pw_index > password.length - 1
      pw_index = 0
    end 
  end 
  
  decrypt
end
#send in l as array ['b', 'c', 'f']
def to_ascii(l)
  [l[0].ord, l[1].ord, l[2].ord]
end 
#go from string of comma separated ascii codes to characters 
def to_chars(str)
  c = ''
  str.split(',').each do |i|
    c += i.chr
  end 
end 

p xor_decrypt([79, 89, 65, 87, 98, 45], to_ascii(["a", "b", "c"]))
#print out each byte 
#f = File.open("p059_cipher.txt", "r+")
#f.each_byte{|ch| putc ch}