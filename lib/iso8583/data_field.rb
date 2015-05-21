module ISO8583
  class DataField < Field
    attr_reader :id

    def initialize(id, data, options)
      @id = id
      super(data, options)
    end

    private

    def value
      return data[1, data.size] if type == :LVAR
      return data[2, data.size] if type == :LLVAR
      return data[3, data.size] if type == :LLLVAR
      data
    end
  end
end
