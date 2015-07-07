# encoding: utf-8

describe Faceter::Functions, ".merge" do

  let(:proc) { -> value { :BAZ if value == input } }

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:merge, proc] }

    let(:input)  { { foo: :FOO, bar: :BAR } }
    let(:output) { :BAZ                     }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:merge, proc, :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR } }
    let(:output) { { foo: :BAZ, bar: :BAR } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:merge, proc, :baz]       }

    let(:input)  { { foo: :FOO, bar: :BAR }            }
    let(:output) { { foo: :FOO, bar: :BAR, baz: :BAZ } }
  end

end # describe Faceter::Functions.merge
