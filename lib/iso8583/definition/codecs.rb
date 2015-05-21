module ISO8583
  A   = Codec.new(/^[a-zA-Z]*$/, 'alpha')
  N   = Codec.new(/^[0-9]*$/, 'numeric')
  S   = Codec.new(//, 'special')
  AN  = Codec.new(/^[a-zA-Z0-9]*$/, 'alphanumeric')
  AS  = Codec.new(//, 'alpha and special')
  NS  = Codec.new(//, 'numeric and special')
  ANS = Codec.new(//, 'alpha, numeric and special')
  B   = Codec.new(//, 'binary')
  Z   = Codec.new(//, 'ISO/IEC 7813 track 2 or 3')
  ALL = Codec.new(//, 'wildcard')
end
