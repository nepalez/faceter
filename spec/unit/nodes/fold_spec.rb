# encoding: utf-8

describe Faceter::Nodes::Fold do

  let(:attributes) { { key: :foo } }

  it_behaves_like :creating_immutable_node

  it_behaves_like :mapping_immutable_input do
    let(:input)  { :FOO          }
    let(:output) { { foo: :FOO } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:input)  { nil          }
    let(:output) { { foo: nil } }
  end

end # describe Faceter::Nodes::Fold
