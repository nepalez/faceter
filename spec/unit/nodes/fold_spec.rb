# encoding: utf-8

describe Faceter::Nodes::Fold do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [to: :foo] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [to: :foo] }

    let(:input)  { :FOO          }
    let(:output) { { foo: :FOO } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [to: :foo] }

    let(:input)  { nil          }
    let(:output) { { foo: nil } }
  end

end # describe Faceter::Nodes::Fold
