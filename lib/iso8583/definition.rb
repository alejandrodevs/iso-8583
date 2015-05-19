module ISO8583
  module Definition
    # Length types definitions.
    FIXED   = -> (data, length, index) { data[index, length] }
    LVAR    = -> (data, length, index) { data[index, 1] + data[index + 1, length] }
    LLVAR   = -> (data, length, index) { data[index, 2] + data[index + 2, length] }
    LLLVAR  = -> (data, length, index) { data[index, 3] + data[index + 3, length] }

    # Codec definitions.
    A   = //
    N   = //
    AN  = //
    AS  = //
    NS  = //
    ANS = //
    B   = //
    Z   = //

    # Fields mapping.
    FIELDS = {
      '1':    { field: 1,   length: 16,   codec: B,   type: FIXED },
      '2':    { field: 2,   length: 19,   codec: N,   type: LLVAR },
      '3':    { field: 3,   length: 6,    codec: N,   type: FIXED },
      '4':    { field: 4,   length: 12,   codec: N,   type: FIXED },
      '7':    { field: 7,   length: 10,   codec: N,   type: FIXED },
      '11':   { field: 11,  length: 6,    codec: N,   type: FIXED },
      '12':   { field: 12,  length: 6,    codec: N,   type: FIXED },
      '13':   { field: 13,  length: 4,    codec: N,   type: FIXED },
      '17':   { field: 17,  length: 4,    codec: N,   type: FIXED },
      '37':   { field: 37,  length: 12,   codec: AN,  type: FIXED },
      '39':   { field: 39,  length: 2,    codec: AN,  type: FIXED },
      '41':   { field: 41,  length: 16,   codec: ANS, type: FIXED },
      '49':   { field: 49,  length: 3,    codec: N,   type: FIXED },
      '70':   { field: 70,  length: 3,    codec: N,   type: FIXED },
    }
  end
end
