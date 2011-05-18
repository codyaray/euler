#!/usr/bin/env ruby

# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

range = (1..20)

prod = 1
range.each do |i|
  prod *= i
end

rcnt = range.to_a.reverse
rcnt.each do |i|
  tmp = prod/i
  fail = false
  rcnt.each do |j|
    if tmp % j != 0
      fail = true
    end
  end
  prod = tmp unless fail
end

p prod