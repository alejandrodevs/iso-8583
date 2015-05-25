module ISO8583
  FIXED = FieldType.new
  FIXED.encoder = -> (value, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length == #{length}" if value.size != length
    value
  end

  FIXED.decoder = -> (data, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if data !~ codec
    raise ISO8583LengthException, "Must have length == #{length}" if data.size != length
    data
  end



  VAR = FieldType.new
  VAR.encoder = -> (value, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length <= #{length}" if value.size > length
    value
  end

  VAR.decoder = -> (data, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if data !~ codec
    raise ISO8583LengthException, "Must have length <= #{length}" if data.size > length
    data
  end



  LVAR = FieldType.new
  LVAR.encoder = -> (value, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length <= #{length}" if value.size > length
    value.size.to_s + value
  end

  LVAR.decoder = -> (data, codec, length) do
    length = data[0, 1].to_i
    value  = data[1, data.size]
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length == #{length}" if data.size != length
    value
  end



  LLVAR = FieldType.new
  LLVAR.encoder = -> (value, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length <= #{length}" if value.size > length
    value.size.to_s.rjust(2, '0') + value
  end

  LLVAR.decoder = -> (data, codec, length) do
    length = data[0, 2].to_i
    value  = data[2, data.size]
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length == #{length}" if data.size != length
    value
  end



  LLLVAR = FieldType.new
  LLLVAR.encoder = -> (value, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length <= #{length}" if value.size > length
    value.size.to_s.rjust(3, '0') + value
  end

  LLLVAR.decoder = -> (data, codec, length) do
    length = data[0, 3].to_i
    value  = data[3, data.size]
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length == #{length}" if data.size != length
    value
  end
end
