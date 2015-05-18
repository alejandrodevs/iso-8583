module ISO8583
  class MTI < String
    FIELDS = [
      { name: :iso_version, position: 0, class: 'ISOVersion' },
      { name: :message_class, position: 1, class: 'MessageClass' },
      { name: :message_function, position: 2, class: 'MessageFunction' },
      { name: :message_origin, position: 3, class: 'MessageOrigin' },
    ]

    FIELDS.each do |field|
      define_method field[:name] do
        eval(field[:class]).new(self[field[:position]])
      end
    end
  end
end
