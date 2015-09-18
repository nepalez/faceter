# encoding: utf-8

describe Faceter::Nodes::Rename do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { { keys: {} } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { keys: { foo: "bar", baz: "qux" } } }

    let(:input)  { { foo: :FOO, baz: :BAZ } }
    let(:output) { { "bar" => :FOO, "qux" => :BAZ } }
  end

end # describe Faceter::Nodes::Rename
