# encoding: utf-8

module Faceter::Nodes

  describe Faceter::Rules::AppendNested do

    let(:one)   { ice_double }
    let(:input) { [left, right] }

    it_behaves_like :skipping_nodes do
      let(:left)  { AddPrefix.new(prefix: :bar) }
      let(:right) { AddPrefix.new(prefix: :foo) }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { Field.new(key: :bar) }
      let(:right) { AddPrefix.new(prefix: :foo) }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { List.new }
      let(:right) { Exclude.new(prefix: :foo) }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)  { List.new { [one] } }
      let(:right) { AddPrefix.new(prefix: :foo) }

      let(:output) { left }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)  { List.new { [one] } }
      let(:right) { AddPrefix.new(prefix: :foo, nested: true) }

      let(:output) { List.new { [one, right] } }
    end

  end # describe Faceter::Rules::AppendNested

end # module Faceter::Nodes
