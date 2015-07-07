# encoding: utf-8

describe Faceter::Nodes::Create do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [from: :bar] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [from: :bar] }

    let(:input)  { { bar: :BAR, baz: :BAZ } }
    let(:output) { :BAR                     }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, from: :bar] }

    let(:input)  { { bar: :BAR, baz: :BAZ }            }
    let(:output) { { bar: :BAR, baz: :BAZ, foo: :BAR } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, from: [:bar, :baz]] }

    let(:input)  { { bar: :BAR, baz: :BAZ }                    }
    let(:output) { { bar: :BAR, baz: :BAZ, foo: [:BAR, :BAZ] } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, from: :bar]      }
    let(:block)      { proc { |bar| bar.to_s } }

    let(:input)  { { bar: :BAR, baz: :BAZ }             }
    let(:output) { { bar: :BAR, baz: :BAZ, foo: "BAR" } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, from: [:bar, :baz]]       }
    let(:block)      { proc { |args| args.map(&:to_s) } }

    let(:input)  { { bar: :BAR, baz: :BAZ }                   }
    let(:output) { { bar: :BAR, baz: :BAZ, foo: %w(BAR BAZ) } }
  end

end # describe Faceter::Nodes::Create
