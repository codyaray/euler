#!/usr/bin/env ruby

# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 x 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

def palindrome? num
  s1 = num.to_s
  s2 = num.to_s.reverse
  s1 == s2
end

list = []
nums = (1..999).to_a.reverse
nums.each do |i|
  nums.each do |j|
    list += [i*j] if palindrome?(i*j)
  end
end

p list.max