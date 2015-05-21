module ISO8583
  class DataField < Field
    attr_reader :id

    def initialize(id, options)
      @id = id
      super(options)
    end
  end
end
