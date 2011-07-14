#!/usr/bin/env ruby

# Starting in the top left corner of a 2x2 grid, there are 6 routes (without 
# backtracking) to the bottom right corner.
#
#     >>>>v   >>v-|    >>v-|
#     |-|-V   |-V>v    |-V-|
#     |-|-V   |-|-V    |-V>>
#
#     V-|-|   V-|-|    V-|-|
#     v>>>v   v>v-|    V-|-|
#     |-|-V   |-v>>    V>>>>
#
# How many routes are there through a 20x20 grid?

# Note that a 2x2 grid, as shown above, can be implemented using a 3x3 array 
# where each element represents a node for travel, rather than the cell between
# the adjacent nodes.
#
# Similarly, a 20x20 grid can be implemented using a 21x21 array.

def create_test_array(size)
  g = []
  count = 1
  (0..size-1).each do |i|
    g[i] = []
    (0..size-1).each do |j|
      g[i][j] = count
      count += 1
    end
  end
  g
end

# print 2D array
def print_array(a)
  spaces = compute_max_num_digits(a)+1
  (0..a.length-1).each do |i|
    (0..a[i].length-1).each do |j|
      printf "%#{spaces}d ", a[i][j]
    end
    print "\n"
  end
end

# Returns the size of a 2D array
def array_size(a)
  sprintf "%d x %d\n\n", a.length, a[0].length
end

