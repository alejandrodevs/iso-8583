module ISO8583
  class Fields
    attr_reader :data

    def initialize
      @data = {}
    end

    def add(field)
      @data[field.id] = field
      sort
      field
    end

    def delete(id)
      @data.delete(id)
      sort
      id
    end

    def ids
      @data.keys
    end

    def [](id)
      @data[id]
    end

    private

    def sort
      @data = data.sort.to_h
    end
  end
end
