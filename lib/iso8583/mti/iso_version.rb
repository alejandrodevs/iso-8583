module ISO8583
  class MTI::ISOVersion < MTI::BaseField
    def meanings
      {
        '0': 'ISO 8583-1:1987 version',
        '1': 'ISO 8583-2:1993 version',
        '2': 'ISO 8583-3:2003 version',
        '3': 'Reserved for ISO use',
        '4': 'Reserved for ISO use',
        '5': 'Reserved for ISO use',
        '6': 'Reserved for ISO use',
        '7': 'Reserved for ISO use',
        '8': 'Reserved for National use',
        '9': 'Reserved for Private use'
      }
    end
  end
end
