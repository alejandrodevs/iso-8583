module ISO8583
  FIXED_ENCODER = -> (value, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length == #{length}" if value.size != length
    value
  end

  FIXED = FieldType.new
  FIXED.encoder = FIXED_ENCODER
  FIXED.decoder = FIXED_ENCODER



  VAR_ENCODER = -> (value, codec, length) do
    raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
    raise ISO8583LengthException, "Must have length <= #{length}" if value.size > length
    value
  end

  VAR = FieldType.new
  VAR.encoder = VAR_ENCODER
  VAR.decoder = VAR_ENCODER




  [:LVAR, :LLVAR, :LLLVAR].each_with_index do |type, index|
    type  = const_set(type, FieldType.new)
    index += 1

    type.encoder = -> (value, codec, length) do
      VAR_ENCODER.call(value, codec, length)
      value.size.to_s.rjust(index, '0') + value
    end

    type.decoder = -> (data, codec, length) do
      length = data[0, index].to_i
      value  = data[index, data.size]
      FIXED_ENCODER.call(value, codec, length)
      value
    end
  end
end
