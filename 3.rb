#!/usr/bin/env ruby

# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

num = 600851475143

# require 'prime'
# primes = Prime.prime_division(num)
# p primes.map{|x,y| x}.max

def prime?(num)
  return false if num == 1
  (2..num-1).each do |i| 
    return false if num % i == 0
  end
  true  
end

(1..num).each do |i|
  puts i if num % i == 0 and prime?(i)
end