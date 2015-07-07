# encoding: utf-8

describe Faceter::Nodes::Exclude do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [:foo] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, :bar] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { baz: :BAZ }                       }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [[:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { baz: :BAZ }                       }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [only: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { baz: :BAZ }                       }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [except: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO }                       }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [except: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR }            }
  end

end # describe Faceter::Nodes::Exclude
