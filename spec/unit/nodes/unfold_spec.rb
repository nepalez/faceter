# encoding: utf-8

describe Faceter::Nodes::Unfold do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [from: :foo] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [from: :foo] }

    let(:input)  { { foo: :FOO } }
    let(:output) { :FOO          }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [from: :foo] }

    let(:input)  { {}  }
    let(:output) { nil }
  end

end # describe Faceter::Nodes::Unfold
