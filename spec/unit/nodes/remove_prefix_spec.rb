# encoding: utf-8

describe Faceter::Nodes::RemovePrefix do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [:foo] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo"] }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ }     }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", only: :foo_bar] }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo_baz" => :BAZ } }
    let(:output) { { bar: { "foo_baz" => :QUX }, "foo_baz" => :BAZ }     }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", except: "foo_baz"] }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo_baz" => :BAZ } }
    let(:output) { { bar: { "foo_baz" => :QUX }, "foo_baz" => :BAZ }     }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", separator: "."] }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { foo_bar: { "foo_baz" => :QUX }, "baz" => :BAZ }     }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", nested: true] }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { bar: { "baz" => :QUX }, "foo.baz" => :BAZ }         }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", except: :foo_bar, nested: true] }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { foo_bar: { "baz" => :QUX }, "foo.baz" => :BAZ }     }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", only: "foo_baz", nested: true] }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { foo_bar: { "baz" => :QUX }, "foo.baz" => :BAZ }     }
  end

end # describe Faceter::Nodes::RemovePrefix
