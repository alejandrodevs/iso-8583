module ISO8583
  module Definition
    # General length types definition.
    FIX = -> (data, length, index) { data[index, length] }
    VAR = -> (data, length, index) { FIX.call(data, length + data[index, length].to_i, index) }

    # Length types definition.
    FIXED   = -> (data, definition, index) { FIX.call(data.data, definition[:length], index) }
    LVAR    = -> (data, definition, index) { VAR.call(data.data, 1, index) }
    LLVAR   = -> (data, definition, index) { VAR.call(data.data, 2, index) }
    LLLVAR  = -> (data, definition, index) { VAR.call(data.data, 3, index) }

    # Codec definition.
    A   = //
    N   = //
    S   = //
    AN  = //
    AS  = //
    NS  = //
    ANS = //
    B   = //
    Z   = //

    # Fields mapping.
    FIELDS = {
      1   => { length: 16,   codec: :B,   type: :FIXED },
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
      70  => { length: 3,    codec: :N,   type: :FIXED },
    }
  end
end
