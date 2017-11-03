def cipher(str,shift)

  alpha = ("a".."z").to_a
  ciph = Hash[alpha.zip(alpha.rotate(shift))]

  str.chars.map {|el| ciph[el] || el}.join

end
