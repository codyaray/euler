#!/usr/bin/env ruby

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see 
# that the 6th prime is 13.
# 
# What is the 10001st prime number?

def prime?(num)
  return false if num == 1
  (2..num-1).each do |i| 
    return false if num % i == 0
  end
  true  
end

num = 1
prime_count = 0
while prime_count < 10001
  prime_count += 1 if prime?(num)
  num += 1
end

p num-1