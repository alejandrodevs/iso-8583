module ISO8583
  class MTI::MessageOrigin < MTI::BaseField
    def meanings
      {
        '0': 'Acquirer',
        '1': 'Acquirer Repeat',
        '2': 'Issuer',
        '3': 'Issuer Repeat',
        '4': 'Other',
        '5': 'Other Repeat'
      }
    end
  end
end
