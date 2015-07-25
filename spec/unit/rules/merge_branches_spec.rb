# encoding: utf-8

module Faceter::Nodes # namespace for constants

  describe Faceter::Rules::MergeBranches do

    let(:one) { ice_double }
    let(:two) { ice_double }

    it_behaves_like :skipping_nodes do
      let(:left)  { AddPrefix.new(prefix: :foo) }
      let(:right) { AddPrefix.new(prefix: :foo) }
      let(:input) { [left, right]                  }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { Field.new(key: :foo)        }
      let(:right) { AddPrefix.new(prefix: :foo) }
      let(:input) { [left, right]               }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { List.new             }
      let(:right) { Field.new(key: :foo) }
      let(:input) { [left, right]        }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { AbstractMapper::Branch.new }
      let(:right) { List.new                   }
      let(:input) { [left, right]              }
    end

    it_behaves_like :skipping_nodes do
      let(:left)  { Field.new(key: :foo) }
      let(:right) { Field.new(key: :bar) }
      let(:input) { [left, right]        }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)   { List.new { [one] } }
      let(:right)  { List.new { [two] } }
      let(:input)  { [left, right]      }

      let(:output) { List.new { [one, two] } }
    end

    it_behaves_like :optimizing_nodes do
      let(:left)   { Field.new(key: :foo) { [one] } }
      let(:right)  { Field.new(key: :foo) { [two] } }
      let(:input)  { [left, right]             }

      let(:output) { Field.new(key: :foo) { [one, two] } }
    end

  end # describe Faceter::Rules::MergeBranches

end # module Faceter
