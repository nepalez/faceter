# encoding: utf-8

describe Faceter::Nodes::StringifyKeys do

  let(:input) { { foo: [{ 1 => :BAZ }] } }

  it_behaves_like :creating_immutable_node do
    let(:attributes) { {} }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { {} }
    let(:output) { { "foo" => [{ "1" => :BAZ }] } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { nested: false } }
    let(:output) { { "foo" => [{ 1 => :BAZ }] } }
  end

end # describe Faceter::Nodes::StringifyKeys
