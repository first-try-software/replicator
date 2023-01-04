require "./registry"

module Replicator
  module Replicable
    macro extended
      def self.replicates(key)
        {{@type}}.__replicable_registry.add(key, self)
      end

      def self.replicate(key, *args, **kwargs)
        {{@type}}.__replicable_registry
          .get(key)
          .map { |klass| klass.new(*args, **kwargs) }
      end

      protected def self.__replicable_registry
        @@__replicable_registry ||= Replicator::Registry(Symbol, {{@type.class}}).new
      end
    end
  end
end
