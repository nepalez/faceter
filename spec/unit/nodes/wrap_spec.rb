# encoding: utf-8

describe Faceter::Nodes::Wrap do

  let(:attributes) { { key: key, selector: selector } }
  let(:selector)   { Selector.new(only: [:foo, :bar]) }

  it_behaves_like :creating_immutable_node do
    let(:key) { :baz }
  end

  it_behaves_like :mapping_immutable_input do
    let(:key) { :bar }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }          }
    let(:output) { { bar: { foo: :FOO, bar: :BAR }, baz: :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:key) { :baz }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: { qux: :QUX } } }
    let(:output) { { baz: { foo: :FOO, bar: :BAR, qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:key) { :bar }

    let(:input)  { { foo: :FOO, bar: { qux: :QUX }, baz: :BAZ }          }
    let(:output) { { bar: { foo: :FOO, bar: { qux: :QUX } }, baz: :BAZ } }
  end

end # describe Faceter::Nodes::Wrap
