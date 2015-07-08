# encoding: utf-8

describe Faceter::Nodes::Wrap do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [to: :baz] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, :bar, to: :bar] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }          }
    let(:output) { { bar: { foo: :FOO, bar: :BAR }, baz: :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [to: :bar, only: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }          }
    let(:output) { { bar: { foo: :FOO, bar: :BAR }, baz: :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [to: :bar, except: :baz] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }          }
    let(:output) { { bar: { foo: :FOO, bar: :BAR }, baz: :BAZ } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [to: :baz, only: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: { qux: :QUX } } }
    let(:output) { { baz: { foo: :FOO, bar: :BAR, qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [to: :bar, only: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: { qux: :QUX }, baz: :BAZ }          }
    let(:output) { { bar: { foo: :FOO, bar: { qux: :QUX } }, baz: :BAZ } }
  end

end # describe Faceter::Nodes::Wrap
