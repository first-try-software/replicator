# Replicator

Replicator is a class registry and factory.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     replicator:
       github: first-try-software/replicator
   ```

2. Run `shards install`

## Usage

```crystal
require "replicator"

abstract class Starship
  extend Replicator::Replicable
end

class Enterprise < Starship
  replicates :galaxy
end

class Cerritos < Starship
  replicates :galaxy
end

Starship.replicate(:galaxy)  # => [#<Enterprise:0x1099ddd60>, #<Cerritos:0x1099ddd70>] : Array(Starship)
```

## Roadmap

Replicator is ready to use in it's current state. The interfaces are unlikey to change. But, there will be new features added per our roadmap:

- [x] Abstract classes can extend Replicator::Replicable to make their descendants "replicable"
- [x] Concrete, "replicable" classes can self register under one or more keys by calling `replicates :symbol`
- [x] Multiple concrete, "replicable" classes can self register under the same key by calling `replicates :symbol`
- [x] Registered, "replicable" classes can be instantiated using the abstract parent's `.replicate(:symbol)` method
- [ ] Positional and named arguments may be passed when initializing "replicable" classes
- [ ] A "replicable" class may register as the `default_replica` for an extended  abstract parent class, and will be instantiated when an unknown key is requested (good for the null object pattern)
- [ ] A "replicable" class may register as `replicates_all` in which case, it is always instantiated and returned in addition to the classes that match a requested key

## Contributing

1. Fork it (<https://github.com/first-try-software/replicator/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Alan Ridlehoover](https://github.com/aridlehoover) - co-creator and maintainer
- [Fito von Zastrow](https://github.com/Fito) - co-creator and maintainer
