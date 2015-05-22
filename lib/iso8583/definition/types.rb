module ISO8583
  FIXED = FieldType.new
  FIXED.encoder = -> (value) { value }
  FIXED.decoder = -> (data)  { data }

  VAR = FieldType.new
  VAR.encoder = -> (value) { value }
  VAR.decoder = -> (data)  { data }

  LVAR = FieldType.new
  LVAR.encoder = -> (value) { value.size.to_s + value }
  LVAR.decoder = -> (data)  { data[1, data.size] }

  LLVAR = FieldType.new
  LLVAR.encoder = -> (value) { value.size.to_s.rjust(2, '0') + value }
  LLVAR.decoder = -> (data)  { data[2, data.size] }

  LLLVAR = FieldType.new
  LLLVAR.encoder = -> (value) { value.size.to_s.rjust(3, '0') + value }
  LLLVAR.decoder = -> (data)  { data[3, data.size] }
end
