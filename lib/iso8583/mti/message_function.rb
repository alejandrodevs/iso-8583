module ISO8583
  class MTI::MessageFunction < MTI::BaseField
    def meanings
      {
        '0': 'Request',
        '1': 'Request Response',
        '2': 'Advice',
        '3': 'Advice Response',
        '4': 'Notification',
        '5': 'Notification Acknowledgement',
        '6': 'Instruction',
        '7': 'Instruction Acknowledgement',
        '8': 'Reserved for ISO use',
        '9': 'Reserved for ISO use'
      }
    end
  end
end
