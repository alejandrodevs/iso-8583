module ISO8583
  class ISO8583Exception < Exception; end
  class ISO8583CodecException < ISO8583Exception; end
  class ISO8583LengthException < ISO8583Exception; end
end
