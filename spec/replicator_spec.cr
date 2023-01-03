require "./spec_helper"

class Galaxy; extend Replicator::Replicable; end

Spectator.describe Replicator do
  describe ".build" do
    it "returns an empty array when an unregistered class is provided" do
      replicas = Galaxy.build(:iks_buruk)
      expect(replicas.size).to eq(0)
    end
  end
end
