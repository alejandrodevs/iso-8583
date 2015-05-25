module ISO8583
  A   = Codec.new(/^[a-zA-Z]*$/, 'Alpha')
  N   = Codec.new(/^[0-9]*$/, 'Numeric')
  S   = Codec.new(//, 'Special')
  AN  = Codec.new(/^[a-zA-Z0-9]*$/, 'Alphanumeric')
  AS  = Codec.new(//, 'Alpha & Special')
  NS  = Codec.new(//, 'Numeric & Special')
  ANS = Codec.new(/^[\x20-\x7E]*$/, 'Alpha, Numeric & Special')
  B   = Codec.new(/^[1|0]*$/, 'Binary')
  Z   = Codec.new(//, 'ISO/IEC 7813 track 2 or 3')
  ALL = Codec.new(//, 'Wildcard')
end
