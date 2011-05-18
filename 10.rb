#!/usr/bin/env ruby

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

def prime?(num)
  return false if num == 1
  return true if num == 2 or num == 3 or num == 5 or num == 7
  return false if num % 2 == 0 or num % 3 == 0 or num % 5 == 0 or num % 7 == 0
  (11..Math.sqrt(num).ceil).each do |i| 
    return false if num % i == 0
  end
  true  
end

sum = 0
(1..1_999_999).each do |i|
  sum += i if prime?(i)
end

p sum