module ISO8583
  class MTI::MessageClass < MTI::BaseField
    def meanings
      {
        '1': 'Authorization Message',
        '2': 'Financial Messages',
        '3': 'File Actions Message',
        '4': 'Reversal and Chargeback Messages',
        '5': 'Reconciliation Message',
        '6': 'Administrative Message',
        '7': 'Fee Collection Messages',
        '8': 'Network Management Message',
        '9': 'Reserved for ISO use'
      }
    end
  end
end
