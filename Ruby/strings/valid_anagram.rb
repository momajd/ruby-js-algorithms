# Leetcode #242
# Given two strings s and t, write a function to determine if t is an anagram of s.
#
# For example,
# s = "anagram", t = "nagaram", return true.
# s = "rat", t = "car", return false.
#
# Note:
# You may assume the string contains only lowercase alphabets.

def valid_anagram?(s, t)
  return false unless s.length == t.length
  letter_count = Hash.new(0)

  s.length.times do |i|
    letter_count[s[i]] += 1
    letter_count[t[i]] -= 1
  end

  letter_count.all? {|k, v| v == 0}
end

# O(n) time
