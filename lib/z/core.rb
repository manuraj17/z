module Z
  class Core
    def initialize(data_store)
      @ds = data_store
    end

    def recommendation(param)
      @ds.fetch(param).flatten
    end

    def store(param)
      @ds.store(param)
    end

    def dump
      @ds.dump
    end
  end
end
