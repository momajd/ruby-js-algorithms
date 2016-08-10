def to_integer(str)
  integer = 0
  i = 0
  neg = false

  if str[0] == "-"
    neg = true
    i += 1
  end

  multiplier = 10**(str.length - 1 - i)
  while i < str.length
    digit = str[i].ord - "0".ord
    integer += multiplier * digit
    multiplier /= 10
    i += 1
  end

  neg ? integer * -1 : integer
end
