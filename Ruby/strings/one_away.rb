# CCI 1.5 One Away

#  pale, ple -> true 
#  pale, bake -> false

def one_away?(str1, str2)
  return false if (str1.length - str2.length).abs > 1
  num_edits = 0

  i, j = 0, 0
  while i < str1.length && j < str2.length
    if str1[i] != str2[j]
      num_edits += 1
      return false if num_edits > 1
      if str1.length < str2.length
        i -= 1
      elsif str2.length < str1.length
        j -= 1
      end
    end
    i += 1
    j += 1
  end
  true
end
