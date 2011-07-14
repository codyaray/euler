#!/usr/bin/env ruby

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then 
# there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# Modified from http://codesnippets.joyent.com/user/incognito/tag/ruby
class Integer

  # Turn a number into the word representation of that number.
  #  1.to_word      # => "one"
  #  126620.to_word # => "one hundred twenty six thousand six hundred and twenty"
  def to_word
    tmp = self / 1000
    final = (self % 1000).hundred_to_word(2)
    place = 3 # special-case the tens and below
    until tmp.zero? do
      final = (tmp % 1000).hundred_to_word(place) + ' ' + final
      place += 1
      tmp = tmp / 1000
    end
    final == '' ? 'zero' : final.sub(/\s+$/,'')
  end

  protected

  def hundred_to_word(place = 0)
    if self.zero?
      ''
    elsif self < 10
      self.append_place(self.digit_to_word, place)
    elsif self < 20
      self.append_place(self.teen_to_word, place)
    elsif self < 100
      self.append_place(self.tens_place_to_word, place)
    else
      (hundreds,tens) = [self / 100, self % 100]
      if tens.zero?
        self.append_place(hundreds.digit_to_word + ' hundred', place)
      else
        # Cody: added 'and' here
        self.append_place(hundreds.digit_to_word + ' hundred and ' + tens.tens_place_to_word, place)
      end
    end
  end

  def append_place(word, place)
    places = %w(one ten hundred thousand million billion trillion)
    if place > 2
      word + ' ' + places[place]
    else
      word
    end
  end

  def tens_place_to_word
    if self > 19
      (tens, ones) = [self/10, self%10]
      ten = %w(twenty thirty forty fifty sixty seventy eighty ninety)[tens-2]
      ten+(ones.zero? ? '' : ' ' + ones.digit_to_word)
    else
      self.teen_to_word
    end
  end

  def teen_to_word
    if self < 10
      self.digit_to_word
    elsif self < 20
      %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)[self-10]
    else
      self.tens_place_to_word
    end
  end

  def digit_to_word
    if self.zero?
      ''
    else
      %w(zero one two three four five six seven eight nine)[self]
    end
  end
end

# for number in [
#     0, 
#     1, 
#     3, 
#     11, 
#     100,
#     1000, 
#     1001, 
#     1100, 
#     1101, 
#     1_000_001, 
#     8_000_000_000, 
#     8_000_000_001, 
#     4_567_890_923, 
#     6_804_567_890_903, 
#     5_006_804_567_890_903
#   ]
#   print "#{number.to_word}\n"
# end

# p "three hundred and forty-two".gsub(/[ -]/,'').length

sum = 0
(1..1000).each do |i|
  sum += i.to_word.gsub(/[ -]/,'').length
end

p sum