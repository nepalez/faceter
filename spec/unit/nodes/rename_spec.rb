# encoding: utf-8

describe Faceter::Nodes::Rename do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [:foo, to: :bar] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, to: "bar"] }

    let(:input)  { { foo: :FOO }     }
    let(:output) { { "bar" => :FOO } }
  end

end # describe Faceter::Nodes::Rename
