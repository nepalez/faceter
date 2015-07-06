# encoding: utf-8

describe Faceter::Functions, ".keep_symbol" do

  let(:function) { -> value { value.to_s.reverse.to_i } }

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:keep_symbol, function] }

    let(:input)  { 123 }
    let(:output) { 321 }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:keep_symbol, function] }

    let(:input)  { :"123" }
    let(:output) { :"321" }
  end

end # describe Faceter::Functions.keep_symbol
