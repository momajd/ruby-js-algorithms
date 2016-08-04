# CCI 1.6 String Compression

# aabcccccaaa -> a2b1c5a3
# return original if smaller than compressed

def string_compression(string)
  compressed = ""

  count = 0
  string.length.times do |i|
    count += 1
    unless string[i] == string[i+1]
      compressed.concat("#{string[i]}#{count}")
      count = 0
    end
  end
  compressed.length < string.length ? compressed : string
end
