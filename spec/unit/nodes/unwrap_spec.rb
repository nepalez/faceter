# encoding: utf-8

describe Faceter::Nodes::Unwrap do

  let(:attributes) { { key: :baz, selector: selector } }
  let(:selector)   { Selector.new(options) }

  it_behaves_like :creating_immutable_node do
    let(:options) { {} }
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { {} }

    let(:input)  { { baz: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { qux: :QUX, foo: :FOO, bar: :BAR, baz: :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :bar] } }

    let(:input)  { { baz: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { baz: { baz: :BAZ }, qux: :QUX, foo: :FOO, bar: :BAR } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :baz] } }

    let(:input)  { { baz: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { qux: :QUX, foo: :FOO, baz: :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :baz] } }

    let(:input)  { { baz: { foo: :FOO, baz: { bar: :BAR } }, qux: :QUX } }
    let(:output) { { qux: :QUX, foo: :FOO, baz: { bar: :BAR } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: :foo } }

    let(:input)  { { foo: { baz: :BAZ }, baz: { foo: { bar: :QUX } } } }
    let(:output) { { foo: { bar: :QUX } } }
  end

end # describe Faceter::Nodes::Unwrap
