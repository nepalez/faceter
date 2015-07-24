# encoding: utf-8

describe Faceter::Nodes::Exclude do

  let(:attributes) { { selector: Selector.new(options) } }

  it_behaves_like :creating_immutable_node do
    let(:options) { {} }
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :bar] } }

    let(:input)   { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output)  { { baz: :BAZ }                       }
  end

end # describe Faceter::Nodes::Exclude
