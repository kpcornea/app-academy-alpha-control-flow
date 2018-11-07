# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.chars.select { |char| char != char.downcase }.join
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  if str.length.odd?
    return str[str.length / 2]
  else
    return str[(str.length / 2 - 1)..str.length / 2]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  str.chars.select { |char| VOWELS.include?(char) }.count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  result = 1
  (1..num).each { |n| result *= n }
  result
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  str = ""

  arr.each_with_index do |ele, i|
    if i == arr.length - 1
      str += ele
    else
      str += ele + separator
    end
  end

  str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  str.chars.map.with_index do |char, i|
    if i.even?
      char.downcase
    else
      char.upcase
    end
  end.join
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  str.split.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  (1..n).map do |num|
    if num % 15 == 0
      "fizzbuzz"
    elsif num % 5 == 0
      "buzz"
    elsif num % 3 == 0
      "fizz"
    else
      num
    end
  end
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num < 2
    return false
  end

  (2..num / 2.0).each do |i|
    if num % i == 0
      return false
    end
  end

  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  (1..num).select { |i| num % i == 0 }
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  (2..num).select { |i| prime?(i) && num % i == 0 }
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  even = 0
  odd = 0
  even_idx = 0
  odd_idx = 0

  arr.each_with_index do |num, i|
    if num.even?
      even += 1
      even_idx = i
    else
      odd += 1
      odd_idx = i
    end

    if even > 1 && odd == 1
      return arr[odd_idx]
    elsif odd > 1 && even == 1
      return arr[even_idx]
    end
  end
end
