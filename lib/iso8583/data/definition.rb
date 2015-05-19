module ISO8583
  module Data::Definition
    FORMATS = {
      A:   //,
      N:   //,
      AN:  //,
      AS:  //,
      NS:  //,
      ANS: //,
      B:   //,
      Z:   //
    }

    FIELDS = {
      '1':    { field: 1,   format: :B,   length: 16,   type: :fixed },
      '2':    { field: 2,   format: :N,   length: 19,   type: :ll },
      '3':    { field: 3,   format: :N,   length: 6,    type: :fixed },
      '4':    { field: 4,   format: :N,   length: 12,   type: :fixed },
      '7':    { field: 7,   format: :N,   length: 10,   type: :fixed },
      '11':   { field: 11,  format: :N,   length: 6,    type: :fixed },
      '12':   { field: 12,  format: :N,   length: 6,    type: :fixed },
      '13':   { field: 13,  format: :N,   length: 4,    type: :fixed },
      '17':   { field: 17,  format: :N,   length: 4,    type: :fixed },
      '37':   { field: 37,  format: :AN,  length: 12,   type: :fixed },
      '39':   { field: 39,  format: :AN,  length: 2,    type: :fixed },
      '41':   { field: 41,  format: :ANS, length: 16,   type: :fixed },
      '49':   { field: 49,  format: :N,   length: 3,    type: :fixed },
      '70':   { field: 70,  format: :N,   length: 3,    type: :fixed },
    }
  end
end
