# encoding: utf-8

describe Faceter::Nodes::Create do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { { keys: [] } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { keys: :bar } }

    let(:input)  { { bar: :BAR, baz: :BAZ } }
    let(:output) { :BAR                     }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { keys: [:bar] } }

    let(:input)  { { bar: :BAR, baz: :BAZ } }
    let(:output) { [:BAR]                   }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { name: :foo, keys: :bar } }

    let(:input)  { { bar: :BAR, baz: :BAZ }            }
    let(:output) { { bar: :BAR, baz: :BAZ, foo: :BAR } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { name: :foo, keys: [:bar, :baz] } }

    let(:input)  { { bar: :BAR, baz: :BAZ }                    }
    let(:output) { { bar: :BAR, baz: :BAZ, foo: [:BAR, :BAZ] } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:block)    { proc { |bar| bar.to_s } }
    let(:attributes) { { name: :foo, keys: :bar } }

    let(:input)  { { bar: :BAR, baz: :BAZ }             }
    let(:output) { { bar: :BAR, baz: :BAZ, foo: "BAR" } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:block)      { proc { |*args| args.map(&:to_s) } }
    let(:attributes) { { name: :foo, keys: [:bar, :baz] } }

    let(:input)  { { bar: :BAR, baz: :BAZ }                   }
    let(:output) { { bar: :BAR, baz: :BAZ, foo: %w(BAR BAZ) } }
  end

end # describe Faceter::Nodes::Create
