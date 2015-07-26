# encoding: utf-8

module Faceter::Nodes # namespace for constants

  describe Faceter::Rules::MergeExcludes do

    let(:foo) { Selector.new(only: 1..2) }
    let(:bar) { Selector.new(only: 3..5) }

    let(:input) { [left, right] }

    it_behaves_like :skipping_nodes do
      let(:left)  { Exclude.new(selector: foo)  }
      let(:right) { AddPrefix.new(prefix: :foo) }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { AddPrefix.new(prefix: :foo) }
      let(:right) { Exclude.new(selector: foo)  }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)  { Exclude.new(selector: foo) }
      let(:right) { Exclude.new(selector: bar) }

      let(:output) { Exclude.new(selector: foo | bar) }
    end

  end # describe Faceter::Rules::MergeExcludes

end # module Faceter
