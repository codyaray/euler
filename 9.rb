#!/usr/bin/env ruby

# A Pythagorean triplet is a set of three natural numbers, a<b<c, for which,
# a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# 3 variables, 2 equations. Reduce to 2 vars, 1 eq. and brute force

# a^2+b^2=c^2
# a+b+c=1000
# => c=1000-a-b
# c^2=(1000-a-b)(1000-a-b)=1000000-1000a-1000b-1000a+a^2+ab-1000b+ab+b^2
#    =1000000-2000a-2000b+2ab+a^2+b^2
# => a^2 + b^2 = 1000000-2000a-2000b+2ab+a^2+b^2
# 0 = 1000000-2000a-2000b+2ab
# 2000(a+b) - 2ab = 1000000
# 1000(a+b) -  ab =  500000
# 

b=0
a_s=0
b_s=0
while a_s==0 and b_s==0
  b+=1
  (1..b-1).each do |a|
    a_s=a and b_s=b if 1000*(a+b)-a*b==500000
  end
end

a=a_s
b=b_s
c=1000-a-b
puts a*b*c