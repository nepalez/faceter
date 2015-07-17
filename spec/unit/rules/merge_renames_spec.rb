# encoding: utf-8

module Faceter::Nodes # namespace for constants

  describe Faceter::Rules::MergeRenames do

    it_behaves_like :skipping_nodes do
      let(:left)  { Rename.new(foo: :bar)               }
      let(:right) { AbstractMapper::Node.new(foo: :bar) }
      let(:input) { [left, right]                       }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { AbstractMapper::Node.new(foo: :bar) }
      let(:right) { Rename.new(foo: :bar)               }
      let(:input) { [left, right]                       }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)  { Rename.new(foo: :bar) }
      let(:right) { Rename.new(baz: :qux) }
      let(:input) { [left, right]         }

      let(:output) { Rename.new(foo: :bar, baz: :qux) }
    end

  end # describe Faceter::Rules::MergeRenames

end # module Faceter
