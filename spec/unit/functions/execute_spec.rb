# encoding: utf-8

describe Faceter::Functions, ".execute" do

  let(:function) { -> v { v.to_s } }

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:execute, function] }

    let(:input)  { :bar  }
    let(:output) { "bar" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:execute, function, :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR } }
    let(:output) { "FOO"                      }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:execute, function, [:foo, :bar]] }

    let(:input)  { { foo: "FOO", bar: "BAR" } }
    let(:output) { "[\"FOO\", \"BAR\"]"       }
  end

end # describe Faceter::Functions.execute
