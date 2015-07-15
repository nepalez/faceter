# encoding: utf-8

module Faceter::Nodes

  describe Faceter::Rules::PrependNested do

    let(:one)   { ice_double    }
    let(:input) { [left, right] }

    it_behaves_like :skipping_nodes do
      let(:left)  { AddPrefix.new(:foo) }
      let(:right) { AddPrefix.new(:bar) }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { AddPrefix.new(:foo) }
      let(:right) { Field.new(:bar)     }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { Exclude.new(:foo) }
      let(:right) { List.new          }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)  { AddPrefix.new(:foo) }
      let(:right) { List.new { [one] }  }

      let(:output) { right }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)  { AddPrefix.new(:foo, nested: true) }
      let(:right) { List.new { [one] }                }

      let(:output) { List.new { [left, one] } }
    end

  end # describe Faceter::Rules::PrependNested

end # module Faceter::Nodes
