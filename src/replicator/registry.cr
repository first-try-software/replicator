module Replicator
  class Registry(K, V)
    private getter :registry

    def initialize
      @registry = Hash(K, Set(V)).new
    end

    def add(key : K, value)
      setup_registry_for(key)
      items_for(key).add(value)
    end

    def get(key : K)
      items_for(key)
    end

    private def setup_registry_for(key)
      registry[key] ||= Set(V).new
    end

    private def items_for(key)
      registered?(key) ? registry[key] : Set(V).new
    end

    private def registered?(key : K)
      registry.keys.includes?(key)
    end
  end
end
