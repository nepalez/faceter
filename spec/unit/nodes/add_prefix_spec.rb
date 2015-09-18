# encoding: utf-8

describe Faceter::Nodes::AddPrefix do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { { prefix: "foo" } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { prefix: "foo" } }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } } }
    let(:output) { { foo_bar: "BAR", "foo_baz" => { qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { prefix: "foo", separator: "." } }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } } }
    let(:output) { { :"foo.bar" => "BAR", "foo.baz" => { qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:selector)   { Selector.new(only: /bar/) }
    let(:attributes) { { prefix: "foo", selector: selector } }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } } }
    let(:output) { { foo_bar: "BAR", "baz" => { qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:selector)   { Selector.new(except: "baz") }
    let(:attributes) { { prefix: "foo", selector: selector } }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } } }
    let(:output) { { foo_bar: "BAR", "baz" => { qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { prefix: "foo", nested: true } }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } } }
    let(:output) { { foo_bar: "BAR", "foo_baz" => { foo_qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:selector)   { Selector.new(except: /b/) }
    let(:attributes) { { prefix: "foo", nested: true, selector: selector } }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } } }
    let(:output) { { bar: "BAR", "baz" => { foo_qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:selector)   { Selector.new(only: /q/) }
    let(:attributes) { { prefix: "foo", nested: true, selector: selector } }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } } }
    let(:output) { { bar: "BAR", "baz" => { foo_qux: :QUX } } }
  end

end # describe Faceter::Nodes::AddPrefix
