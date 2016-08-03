# LeetCode #49
# Given an array of strings, group anagrams together.
#
# For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
# Return:
#
# [
#   ["ate", "eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]
# Note: All inputs will be in lower-case.


def group_anagrams(words)
  anagrams = Hash.new {|h, k| h[k] = Array.new}

  words.each do |word|
    sorted = word.chars.sort.join
    anagrams[sorted] << word
  end

  anagrams.values
end

# O(n * mlog(m)), where n is the number of words and n is the length of each
# word (assuming they are roughly the same)
