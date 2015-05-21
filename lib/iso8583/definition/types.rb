module ISO8583
    FIX = -> (data, length, index) { data[index, length] }
    VA = -> (data, length, index) { FIX.call(data, length + data[index, length].to_i, index) }

    # Length types definition.
    FIXED   = -> (data, definition, index) { FIX.call(data.data, definition[:length], index) }
    VAR     = -> (data, definition, index) { VA.call(data.data, 0, index) }
    LVAR    = -> (data, definition, index) { VA.call(data.data, 1, index) }
    LLVAR   = -> (data, definition, index) { VA.call(data.data, 2, index) }
    LLLVAR  = -> (data, definition, index) { VA.call(data.data, 3, index) }
end
