# encoding: utf-8

describe Faceter::Nodes::RemovePrefix do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { { prefix: :foo } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { prefix: "foo" } }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:selector)   { Selector.new only: /foo_bar/ }
    let(:attributes) { { prefix: "foo", selector: selector } }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo_baz" => :BAZ } }
    let(:output) { { bar: { "foo_baz" => :QUX }, "foo_baz" => :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:selector)   { Selector.new except: "foo_baz" }
    let(:attributes) { { prefix: "foo", selector: selector } }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo_baz" => :BAZ } }
    let(:output) { { bar: { "foo_baz" => :QUX }, "foo_baz" => :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { prefix: "foo", separator: "." } }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { foo_bar: { "foo_baz" => :QUX }, "baz" => :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { prefix: "foo", nested: true } }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { bar: { "baz" => :QUX }, "foo.baz" => :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:selector)   { Selector.new(except: :foo_bar) }
    let(:attributes) { { prefix: "foo", selector: selector, nested: true } }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { foo_bar: { "baz" => :QUX }, "foo.baz" => :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:selector)   { Selector.new(only: "foo_baz") }
    let(:attributes) { { prefix: "foo", selector: selector, nested: true } }

    let(:input)  { { foo_bar: { "foo_baz" => :QUX }, "foo.baz" => :BAZ } }
    let(:output) { { foo_bar: { "baz" => :QUX }, "foo.baz" => :BAZ } }
  end

end # describe Faceter::Nodes::RemovePrefix
