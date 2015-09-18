# encoding: utf-8

describe Faceter::Nodes::Unfold do

  let(:attributes) { { key: :foo } }

  it_behaves_like :creating_immutable_node

  it_behaves_like :mapping_immutable_input do
    let(:input)  { { foo: :FOO } }
    let(:output) { :FOO }
  end

  it_behaves_like :mapping_immutable_input do
    let(:input)  { {} }
    let(:output) { nil }
  end

end # describe Faceter::Nodes::Unfold
