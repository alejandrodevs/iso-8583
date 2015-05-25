module ISO8583
  class Fields
    attr_reader :data

    def initialize
      @data = {}
    end

    def add(field)
      @data[field.id] = field
      @data = data.sort.to_h
      field
    end

    def delete(id)
      @data.delete(id)
      id
    end

    def ids
      @data.keys
    end

    def [](id)
      @data[id]
    end
  end
end
