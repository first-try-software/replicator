require "./spec_helper"

abstract class Starship
  extend Replicator::Replicable

  getter :designation

  def initialize(@designation = "")
  end
end

class Enterprise < Starship
  replicates :galaxy
  replicates :enterprise
end

class Cerritos < Starship
  replicates :galaxy
  replicates :cerritos
end

Spectator.describe Replicator do
  it "returns an empty array when an unregistered class is requested" do
    replicas = Starship.replicate(:iks_buruk)
    expect(replicas.size).to eq(0)
  end

  it "allows a class to be registered under multiple keys" do
    replicas = Starship.replicate(:enterprise)
    expect(replicas.size).to eq(1)
    expect(replicas.first).to be_a_kind_of(Enterprise)
  end

  it "allows multiple classes to be registred under the same key" do
    replicas = Starship.replicate(:galaxy)
    expect(replicas.size).to eq(2)
    expect(replicas.first).to be_a_kind_of(Enterprise)
    expect(replicas.last).to be_a_kind_of(Cerritos)
  end

  it "allows passing arguments when instantiating classes" do
    replicas = Starship.replicate(:enterprise, designation: "NCC-1701-D")
    expect(replicas.size).to eq(1)
    expect(replicas.first.designation).to eq("NCC-1701-D")
  end
end
