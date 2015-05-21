module ISO8583
  MTI_LENGTH = 4
  BMP_LENGTH = 16
  HDR_LENGTH = 12
  DTA_LENGTH = Float::INFINITY

  HDR_DEFINITION = { length: HDR_LENGTH, codec: :AN,  type: :FIXED }
  MTI_DEFINITION = { length: MTI_LENGTH, codec: :N,   type: :FIXED }
  BMP_DEFINITION = { length: BMP_LENGTH, codec: :AN,  type: :FIXED }
  DTA_DEFINITION = { length: DTA_LENGTH, codec: :ALL, type: :INF }

  FIELDS = {
    1   => { length: 16,   codec: :AN,  type: :FIXED },
    2   => { length: 19,   codec: :N,   type: :LLVAR },
    3   => { length: 6,    codec: :N,   type: :FIXED },
    4   => { length: 12,   codec: :N,   type: :FIXED },
    7   => { length: 10,   codec: :N,   type: :FIXED },
    11  => { length: 6,    codec: :N,   type: :FIXED },
    12  => { length: 6,    codec: :N,   type: :FIXED },
    13  => { length: 4,    codec: :N,   type: :FIXED },
    17  => { length: 4,    codec: :N,   type: :FIXED },
    37  => { length: 12,   codec: :AN,  type: :FIXED },
    39  => { length: 2,    codec: :AN,  type: :FIXED },
    41  => { length: 16,   codec: :ANS, type: :FIXED },
    49  => { length: 3,    codec: :N,   type: :FIXED },
    65  => { length: 16,   codec: :AN,  type: :FIXED },
    70  => { length: 3,    codec: :N,   type: :FIXED },
  }
end
