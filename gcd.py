# Find the greatest common denominator of two numbers
# using Euclid's algorithm


def gcd(a, b):
    while (b != 0):
      t = a
      a = b
      b = t % b
      
    return a, b
    
        
# try out the function with a few examples
# step 1, a = 96; b = 60
# step 2, t = 60; a = 60; b = 36
# step 3, t = 60; a = 36; b = 24
# step 4, t = 36; a = 24; b = 12
# step 5, t = 24; a = 12; b = 12
# step 6, t = 12; a = 12; b = 0 -- done!
print(gcd(60, 96))  # should be 12
# step 1, t = 20; a = 8; b = 4
# step 2, t = 8;  a = 4; b = 0 -- done!
print(gcd(20, 8))   # should be 4

















