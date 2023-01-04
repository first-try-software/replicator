# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Abstract classes can extend Replicator::Replicable to make their descendants "replicable"
- Concrete, "replicable" classes can self register under one or more keys by calling `replicates :symbol`
- Multiple concrete, "replicable" classes can self register under the same key by calling `replicates :symbol`
- Registered, "replicable" classes can be instantiated using the abstract parent's `.replicate(:symbol)` method
