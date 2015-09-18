# encoding: utf-8

module Faceter::Nodes # namespace for constants

  describe Faceter::Rules::MergeRenames do

    it_behaves_like :skipping_nodes do
      let(:left)  { Rename.new(keys: { foo: :bar }) }
      let(:right) { AbstractMapper::AST::Node.new(keys: { foo: :bar }) }
      let(:input) { [left, right] }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { AbstractMapper::AST::Node.new(keys: { foo: :bar }) }
      let(:right) { Rename.new(keys: { foo: :bar }) }
      let(:input) { [left, right] }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)  { Rename.new(keys: { foo: :bar }) }
      let(:right) { Rename.new(keys: { baz: :qux }) }
      let(:input) { [left, right] }

      let(:output) { Rename.new(keys: { foo: :bar, baz: :qux }) }
    end

  end # describe Faceter::Rules::MergeRenames

end # module Faceter::Nodes
